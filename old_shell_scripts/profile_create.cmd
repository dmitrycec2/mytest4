@echo off &SETLOCAL

ECHO The %~nx0 script args are...

for %%I IN (%*) DO (    
call set "Myvar=%%Myvar%% %%I"
)
ECHO %Myvar%

pause

