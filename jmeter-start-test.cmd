@echo off



set jmeter_h=C:\instr\apache-jmeter-5.4.1\bin
set Y=%DATE:~6,4%
set M=%DATE:~3,2%
set D=%DATE:~0,2%
set HH=%TIME:~0,2%
set MM=%TIME:~3,2%
echo.
echo %~dp1

title Jmeter Test: %~nx1

echo   Jmeter Log - "Test_%Y%%M%%D%.%HH%%MM%_%~nx1_Jmeter.log"
echo  Console Out - "Test_%Y%%M%%D%.%HH%%MM%_%~nx1_Console.log"
echo Table Result - "Test_%Y%%M%%D%.%HH%%MM%_%~nx1_TableResult.jtl"
echo.
echo Test start: %Y%%M%%D%.%HH%%MM%
echo.
echo Running %~nx1...

call "%jmeter_h%\jmeter"  -n -p "%~dp0profiles\%2\%~n1.properties" -t "%1" -j "results\%2\Test_%Y%%M%%D%.%HH%%MM%_%~nx1_Jmeter.log" -l "results\%2\Test_%Y%%M%%D%.%HH%%MM%_%~nx1_TableResult.jtl" > "results\%2\Test_%Y%%M%%D%.%HH%%MM%_%~nx1_Console.log" 

del "%~dp0profiles\%2\%~n1.properties"

set Y=%DATE:~6,4%
set M=%DATE:~3,2%
set D=%DATE:~0,2%
set HH=%TIME:~0,2%
set MM=%TIME:~3,2%
echo.
echo Test  stop: %Y%%M%%D%.%HH%%MM%
echo.

pause
:END