@ECHO OFF
SET pseudoCurlCommand="echo "
ECHO "The current directory is '%cd'"

GOTO:MAIN

:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:defaultInstallApplication
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET executableUrl=%~2
        SET curlExecutionStatement="^"%pseudoCurlCommand%^" -o ^"%cd%\%applicationName%^" ^"%executableUrl%^""
        
        call:installApplication %applicationName% %curlExecutionStatement%
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################




:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:installApplication
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET curlExecutionStatement=%~2

        ECHO "Would you like to download and install '%applicationName%'?"
        :PROMPT
            SET /P areYouSure="Are you sure (Y/[N])?"
            IF /I "%areYouSure%" NEQ "y" GOTO END
                ECHO "downloading %applicationName% installer..."
                %curlExecutionStatement%

                ECHO "Installing %applicationName%"
                START %applicationName%
        :END
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################




call:defaultInstallApplication "installer_vscode.exe"               "https://az764295.vo.msecnd.net/stable/2213894ea0415ee8c85c5eea0d0ff81ecc191529/VSCodeUserSetup-ia32-1.36.1.exe"
call:installApplication "installer_intellij-v2020.2.1.exe"^
    "%pseudoCurlCommand% -o ^"%cd%\installer_intellij-v2020.2.1.exe^" ^"https://download-cf.jetbrains.com/idea/ideaIU-2020.2.1.exe^"^
        -H ^"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0^"^
        -H ^"Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8^"^
        -H ^"Accept-Language: en-US,en;q=0.5^"^
        -H ^"Referer: https://www.jetbrains.com/idea/download/download-thanks.html?platform=windows^"^
        -H ^"Connection: keep-alive^"^
        -H ^"Cookie: _gcl_au=1.1.1556281742.1599423447; _ga=GA1.1.1454185254.1599423448; _gid=GA1.2.2076224765.1599423448; _ga_TNKGS6FGXX=GS1.1.1599423447.1.1.1599423467.0^"^
        -H ^"Upgrade-Insecure-Requests: 1^""
