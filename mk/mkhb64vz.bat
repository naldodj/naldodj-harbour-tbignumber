@echo off
SETLOCAL ENABLEEXTENSIONS
    echo BATCH FILE FOR Harbour MinGW64
    rem ============================================================================
    D:
    CD D:\GitHub\tBigNumber\mk\
    IF EXIST env_mkHB64.txt (
        DEL env_mkHB64.txt /F /Q
    )
    SET > env_mkHB64.txt
        SET HB_PATH=d:\GitHub\naldodj-hb\
        SET MinGW64_PATH=D:\mingw64\bin\
        SET PATH=%MinGW64_PATH%;%HB_PATH%;%PATH%;
        SET HB_CPU=x86_64
        SET HB_PLATFORM=win
        SET HB_COMPILER=mingw64
        SET HB_CCPATH=%MinGW64_PATH%
        SET HB_BUILD_SHARED=yes
        IF EXIST D:\OpenSSL64 (
            IF EXIST D:\OpenSSL64\INC32 (
                SET HB_WITH_OpenSSL64=D:\OpenSSL64\INC32
            ) ELSE IF EXIST D:\OpenSSL64\INCLUDE (
                SET HB_WITH_OpenSSL64=D:\OpenSSL64\INCLUDE
            )
        )
        IF EXIST D:\FreeImage\Dist\x64 (
            SET HB_WITH_FREEIMAGE=D:\FreeImage\Dist\x64
        )
        IF EXIST D:\mxml (
            SET HB_WITH_MXML=D:\mxml
        )
        rem SET HB_BUILD_VERBOSE=yes
           D:
           CD %HB_PATH%
           IF "%1"=="-B" (
                IF EXIST ".\bin\win\mingw64" (
                    rmdir ".\bin\win\mingw64" /s /q
                )
                IF EXIST ".\lib\win\mingw64" (
                    rmdir ".\lib\win\mingw64" /s /q
                )
           )
           %HB_PATH%\win-make.exe -f MakeFile %1
    D:
    CD D:\GitHub\tBigNumber\mk\
    for /f %%e in (env_mkHB64.txt) do (
        SET %%e
    )
    DEL env_mkHB64.txt /F /Q
ENDLOCAL
