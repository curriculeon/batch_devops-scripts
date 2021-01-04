@ECHO OFF
SET pseudoCurlCommand="echo "
ECHO "The current directory is '%cd%'"

GOTO:MAIN

:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:retainContainer
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET applicationContainerId="docker ps -aqf name=^%applicationName%"
		FOR /f "tokens=*" %%i IN ('docker ps -a') DO (
			IF NOT "%%i"=="%applicationContainerId%" (
				docker container stop %%i
				docker container rm %%i
			)
		)
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################




:MAIN

call:retainContainer "jenkins"

PAUSE