@setlocal
    del .\log\*.* /S /Q
    call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
    F:\harbour_msvc\bin\win\msvc64\hbmk2 -comp=msvc64 ..\hbp\_tbigNumber_msvc.hbp
    F:\harbour_msvc\bin\win\msvc64\hbmk2 -comp=msvc64 ..\hbp\tbigntst_msvc.hbp -l ../hbc/_tbigNumber.hbc
@endlocal
