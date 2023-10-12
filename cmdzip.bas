' based on sample libzip.bas included with fb
' with courtesy to srvaldez for providing dlls windows 32bit / 64bit
' see https://www.freebasic.net/forum/viewtopic.php?p=300605&hilit=open+zip#p300605
' more info https://www.freebasic.net/wiki/ExtLibZip
' tweaked by thrive4 oktober 2023
' todo file attributes in zip archive are not visible but are present when file is extracted...

#include once "zip.bi"
#include once "windows.bi"
#include once "utilfile.bas"
#cmdline "app.rc"

#ifdef __FB_LINUX__
    const pathchar = "/"
#else
    const pathchar = "\"
#endif
dim shared cnt as integer = 0

' date and time routines
' get and convert unixtime aka epoch(1970)
' courtesy adeyblue https://www.freebasic.net/forum/viewtopic.php?p=267242&hilit=ctime&sid=353b783c321fe1c8bf4d23a9708ebd8c#p267242
' and michaelw https://www.freebasic.net/forum/viewtopic.php?p=164305
function unixtime2date(t as time_t, ctimeon as boolean = false) as string
    dim timestr as zstring ptr
    dim buffer  as zstring*100
   
    ' standard notation 
    if ctimeon then
        timestr = ctime(@t)
        return *timestr
    else
        ' yyyy-mm-dd hh:mm:ss formated notation
        ' see for refrence https://cplusplus.com/reference/ctime/strftime/
        strftime( @buffer, 100, "%Y-%m-%d %H:%M:%S", gmtime(@t))
        return buffer
    end if
end function

' via https://www.epochconverter.com/programming/c
function date2unixtime(stamp as string, current as boolean = false) as long
    Dim tt As tm
    tt.tm_year  = val(mid(stamp, 1, 4)) - 1900
    tt.tm_mon   = val(mid(stamp, 6, 2)) - 1
    tt.tm_mday  = val(mid(stamp, 9, 2))
    tt.tm_hour  = val(mid(stamp, 12, 2))
    tt.tm_min   = val(mid(stamp, 15, 2))
    tt.tm_sec   = val(mid(stamp, 18, 2))
    tt.tm_isdst = -1
    if current then
        return time_(null)
    else
        return mktime(@tt)
    end if
end function

' set date time stamp file
' courtesy dodicat https://www.freebasic.net/forum/viewtopic.php?p=258248#p258248
function setdatetimefile(file as wstring, stamp as string, usetimezone as boolean = false) as boolean
    dim systime    as SYSTEMTIME
    dim filetime   as FILETIME
    Dim tz         As TIME_ZONE_INFORMATION
    dim as HANDLE fn = CreateFile(file, FILE_WRITE_ATTRIBUTES,_
           FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING,_
           FILE_ATTRIBUTE_NORMAL, NULL)

    if FileExists(file) then
        'nop
    else
        print file & " could not be found"
    end if

    ' init and setup new datetime structure for file
    GetSystemTime(@systime)
    systime.wDay    = val(mid(stamp, 9, 2))
    systime.wMonth  = val(mid(stamp, 6, 2))
    systime.wYear   = val(mid(stamp, 1, 4))
    if usetimezone then
        GetTimeZoneInformation @tz
        'Print "Name: " & tz.StandardName
        ' ? adding the bias works not sure why
        systime.wHour = val(mid(stamp, 12, 2)) + (tz.Bias \ 60)
    else
        systime.wHour = val(mid(stamp, 12, 2))
    end if
    systime.wMinute = val(mid(stamp, 15, 2))
    systime.wSecond = val(mid(stamp, 18, 2))

    SystemTimeToFileTime(@systime, @filetime)
    function = SetFileTime(fn, NULL, NULL, @filetime)
    CloseHandle(fn)
end function
' end date and time routines

' zip routines
' create folders included in archive on os filesystem
Sub create_parent_dirs(ByVal file As ZString Ptr)
    Dim As UByte Ptr p = file
    Do
        Select Case (*p)
        Case Asc(pathchar)
            *p = 0
'print *file
                MkDir(*file)
            *p = Asc(pathchar)
        Case 0
            Exit Do
        End Select
        p += 1
    Loop
End Sub

' information on file number 'i' in the .zip file, then extracts it, plus directories as needed.
Private Sub unpack_zip_file(ByVal zip As zip_t Ptr, path as string, ByVal i As Integer, withdate as boolean)
    #define BUFFER_SIZE (1024 * 512)
    Static As UByte chunk(0 To (BUFFER_SIZE - 1))
    #define buffer (@chunk(0))

    ' Retrieve the filename.
    Dim As String filename = *zip_get_name(zip, i, 0)
    ' brute force the path reconstruction if needed
    filename = replace(filename, "/", pathchar)
    ' filter out drive if needed
    if instr(filename, ":") > 0 and len(filename) > 3 then
        filename = right(filename, len(filename) - 3)
    end if
    ' Retrieve the file size via a zip_stat().
    Dim As zip_stat stat
    If (zip_stat_index(zip, i, 0, @stat)) Then
        Print "zip_stat() failed"
        Return
    End If

    If ((stat.valid And ZIP_STAT_SIZE) = 0) Then
        Print "could not retrieve file size from zip_stat()"
        Return
    End If
    Print path & "\" & filename & ", ";
    Print stat.size & " bytes"
    ' create paths from archive if needed
    create_parent_dirs(path + "\" + mid$(filename, 1, instrrev(filename, "\")))

    ' write out the file
    Dim As Integer fo = FreeFile()
    If (Open(path + "\" + filename, For Binary, Access Write, As #fo)) Then
        Print "could not open output file"
        Return
    End If

    ' input for the file comes from libzip
    Dim As zip_file_t Ptr fi = zip_fopen_index(zip, i, 0)
    Do
        ' decode
        Dim As Integer bytes = _
            zip_fread(fi, buffer, BUFFER_SIZE)
        If (bytes < 0) Then
            Print "zip_fread() failed"
            Exit Do
        End If

        ' EOF?
        If (bytes = 0) Then
            Exit Do
        End If

        ' write <bytes> amount of bytes of the file
        If (Put(#fo, , *buffer, bytes)) Then
            Print "file output failed"
            Exit Do
        End If

    Loop

    zip_fclose(fi)
    Close #fo

    ' preserve date time stamp file from archive
    if withdate then
        setdatetimefile(path + "\" + filename, unixtime2date(stat.mtime))
    end if
    cnt += 1
End Sub

Sub unpack_zip(ByRef archive As String, path as string, withdate as boolean = true)
    Dim As zip_t Ptr zip = zip_open(archive, ZIP_CHECKCONS, NULL)
    If (zip = NULL) Then
        Print "could not open input file " & archive
        Return
    End If

    mkdir path

    ' get items in zip
    For i As Integer = 0 To (zip_get_num_entries(zip, 0) - 1)
        unpack_zip_file(zip, path, i, withdate)
    Next

    zip_close(zip)
End Sub

Sub data2zip(ByVal fname As ZString Ptr, ByVal id_d As ZString Ptr, ByVal myData As ZString Ptr, byval fsize as long, withdate as boolean)
	Dim As Any Ptr pzo
	Dim As Any Ptr pzsb
    dim idx as uinteger

	pzo = zip_open(fname, ZIP_CREATE, 0)
	If pzo = 0 Then End
    ' somehow  Len(*myData) does not contain the right
    ' filesize on non text files but does for text files....
    ' todo find out why workaround pass fsize as extra variable
	'pzsb = zip_source_buffer(pzo, myData, Len(*myData), 0)
	pzsb = zip_source_buffer(pzo, myData, fsize, 0)
	If pzsb = 0 Then End
   
	idx = zip_file_add(pzo, id_d, pzsb, ZIP_FL_OVERWRITE)
    ' preserve datetime stamp file when added to archive
    ' get filedatetime stamp and convert to unixtime
    if withdate then
        zip_file_set_mtime(pzo, idx, date2unixtime(format(FileDateTime(*id_d), "yyyy-mm-dd hh:mm:ss")), ZIP_FL_OVERWRITE)
    else
        ' nop
    end if
	zip_close(pzo)
 
End Sub

' add file(s) to zip archive optional withpath -p
sub file2zip(archive as string, filename as string, withpath as boolean = false, withdate as boolean = true)
    Dim f       As Integer
    Dim buffer  As String
    f = freefile

    Open filename For Binary Access Read As #f
        If LOF(f) > 0 Then
            buffer = String(LOF(f), 0)
            Get #f, , buffer
        End If
    Close #f

    ' optional add path to archive file
    if withpath = true then
        ' nop
    else
        filename = mid(filename, instrrev(filename, "\") + 1)
    end if

    if instr(archive, ":") = 0 then
        archive = exepath + "\" + archive
    else
        if checkpath(mid(archive, 1, instrrev(archive, "\"))) = false then
            logentry("fatal", "please specify an correct path for archive name.. '" & archive & "'")
        end if    
    end if    
    data2zip(archive , filename, buffer, len(buffer), withdate)

end sub

sub text2zip(archive as string, filename as string, text as string, withdate as boolean = true)
    data2zip(archive, filename, text, len(text), withdate)
    print "created archive " + archive + " added " + filename
end sub

function dir2zip(root as string, withpath as boolean = false, withdate as boolean = true) as boolean
    ' init recursive dir routine
    dim file           as string
    dim fileext        as string = "*"
    dim filterext      as string     
    dim fsize          as long
    dim fdate          as string
    dim fattr          as string
    dim dummy          as string
    redim p(1 to 1)    As string
    dim as integer j = 1, n = 1, attrib
    ' recursive scan folder(s) for filepattern
    p(1) = mid(root, 1, instrrev(root, "\"))   ' init tree
    if( right( p(1), 1 ) <> pathchar ) then
        file = dir(p(1), fbNormal or fbDirectory, @attrib)
        if( attrib and fbDirectory ) then
            p(1) += pathchar
        end if
    end if
    if instr(root, "*.") = 0 and instr(root, ".") > 0 then
        filterext = mid(root, instrrev(root, "\") + 1)
    end if    
    if instr(root, "*.") > 0 then
        filterext = mid(root, instrrev(root, "\") + 1)
    end if
    while j <= n
        file = dir(p(j) + "*", fbNormal or fbDirectory, @attrib)
        while file > ""
            if (attrib and fbDirectory) then
                if file <> "." and file <> ".." then
                    n += 1
                    redim preserve p(1 to n)
                    p(n) = p(j) + file + pathchar
                end if
            else
                fileext = lcase(mid(file, instrrev(file, ".")))
                if instr(1, filterext, fileext) > 0 and len(fileext) > 3 then
                    ' get specific file information
                    dummy = mid(p(j), 1, instrrev(p(j), "\"))
                    fsize = filelen(dummy & file)
                    fdate = Format(FileDateTime(dummy & file), "yyyy-mm-dd hh:mm:ss" )
                    If (attrib And fbReadOnly) <> 0 Then fattr = "read-only"
                    If (attrib And fbHidden  ) <> 0 Then fattr = "hidden"
                    If (attrib And fbSystem  ) <> 0 Then fattr = "system"
                    If (attrib And fbArchive ) <> 0 Then fattr = "archived"
                    'print mid(p(j), 1, instrrev(p(j), "\")) & d
                    file2zip(command(2), dummy & file, withpath, withdate)
                    print dummy & file & "," & fsize & "," & fdate & "," & fattr
                    cnt += 1
                end if
            end if
            file = dir(@attrib)
        wend
        j += 1
    wend

    return true

end function
' end zip routines

' main
dim itm          as string
dim inikey       as string
dim inival       as string
dim inifile      as string = exepath + "\conf\" + "conf.ini"
dim dummy        as string
dim f            as integer
dim preservepath as boolean
dim preservedate as boolean

' init app overwrite by commandline or config file
if FileExists(inifile) = false then
    logentry("error", inifile + "file does not excist")
else 
    f = readfromfile(inifile)
    Do Until EOF(f)
        Line Input #f, itm
        if instr(1, itm, "=") > 1 then
            inikey = trim(mid(itm, 1, instr(1, itm, "=") - 2))
            inival = trim(mid(itm, instr(1, itm, "=") + 2, len(itm)))
            select case inikey
                case "locale"
                    locale = inival
                case "logtype"
                    logtype = inival
                case "usecons"
                    usecons = inival
                case "preservepath"
                    preservepath = cbool(inival)
                case "preservedate"
                    preservedate = cbool(inival)
            end select
            'print inikey + " - " + inival
        end if    
    loop    
end if    

' parse if no commandline options are present
select case true
    case len(command(1)) = 0
        displayhelp(locale)
        logentry("terminate", "normal termination ")
end select

' parse if commandline options are present
dim i as integer
while i < __FB_ARGC__
	select case left(command(i), 1)
        case "-"
            select case command(i)
                case "-h", "-help", "--help", "-man"
                    displayhelp(locale)
                    logentry("terminate", "normal termination ")
                case "-v", "-ver"
                    print appname + " version " + exeversion
                    ' todo odd jumps to line 472 and resumes execution disregarding end
                    logentry("terminate", "normal termination ")
                case "-t"
                    text2zip("teststring.zip", "file3.txt", "Sic Parvis Magna ~ Thus, Great Things From Small Things Come...",)
                    logentry("terminate", "normal termination ")
                case "-pp"
                    ' nop
                case else 
                    logentry("fatal", "invalid switch '" & command(i) & "'")
            end select
        case "/"
            select case command(i)
                case "/?"
                    displayhelp(locale)
                    logentry("terminate", "normal termination ")
                case else
                    logentry("fatal", "invalid switch '" & command(i) & "'")
            end select
	end select
    select case i
        case 1
            select case true
                ' extract from archive
                case instr(command(1), ".zip") > 0
                    if FileExists(command(1)) then
                        ' nop
                    else
                        logentry("fatal", "please specify a valid archive name.. '" & command(i) & "'")
                    end if
                    if command(2) = "" then
                        logentry("fatal", "please specify export folder.. '" & command(i) & "'")
                    end if
                    print "extracting..."
                    unpack_zip(command(1), command(2), preservedate)
                    print
                    print cnt & " file(s) extracted from " & command(2)
                ' add to archive
                case instr(command(1), ".") > 0
                    if checkpath(mid(command(1), 1, instrrev(command(1), "\"))) = false then
                        logentry("fatal", "please specify a valid path.. '" & command(i) & "'")
                    end if              
                    if instr(command(1), "*.") = 0 then
                        if instr(command(1), ":") = 0 then
                            if FileExists(curdir + "\" + command(1)) then
                                ' nop
                            else
                                logentry("fatal", "please specify a valid file.. '" & command(i) & "'")
                            end if
                        else
                            if FileExists(command(1)) then
                                ' nop
                            else
                                logentry("fatal", "please specify a valid file.. '" & command(i) & "'")
                            end if
                        end if
                    end if
                    ' multiple files
                    if instr(command(1), "*.") > 0 then
                        if len(command(2)) = 0 then
                            logentry("fatal", "please specify an archive name.. '" & command(i) & "'")
                        end if
                        if instr(command(3), "-p") > 0 then
                            preservepath = true
                        end if
                        print "adding..."
                        dir2zip(command(1), preservepath, preservedate)
                        print
                        print cnt & " file(s) added to " & command(2)
                        logentry("terminate", "normal termination")                        
                    end if
                    ' single file
                    if len(command(2)) = 0 then
                        logentry("fatal", "please specify an archive name.. '" & command(i) & "'")
                    else
                        if instr(command(3), "-p") > 0 then
                            preservepath = true
                        end if
                        print "adding..."
                        if instr(command(1), ":") > 0 then
                            dummy = command(1)
                        else
                            dummy = curdir + "\" + command(1)
                        end if
                        dir2zip(dummy, preservepath, preservedate)
                        print
                        print cnt & " file(s) added to " & command(2)
                        logentry("terminate", "normal termination")                        
                    end if
            end select
    end select
    i += 1
wend
