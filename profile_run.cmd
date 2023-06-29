@echo off

rem SET VAR AND DIR
set profile_name=%1
set scripts_names=%2
set script_file=%3

FOR /F "delims=" %%I IN (%scripts_names%) DO SET Unquoted=%%I

if not exist results\%profile_name% (mkdir results\%profile_name%)

rem CREATE FILE PARAMS:
pushd profiles\%profile_name%
java -jar ..\..\jmeter_parser_ALL.jar scripts_params.xlsx true %script_file% %Unquoted%
popd

rem START TESTS:
start jmeter-start-test.cmd scripts\%script_file%.jmx %profile_name% ^&^& exit

