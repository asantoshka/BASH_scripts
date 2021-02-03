@echo off 
cd C:\Users\asant\OneDrive\Desktop
c:
set file=test
echo %date% %time% : %file% renaming  >> log.txt
IF EXIST "%file%.txt" (
	ren %file%.txt %file%-%date%.txt
	IF EXIST "%file%-%date%.txt" (
		echo %date% %time% : %file% Backup created successfully  >> log.txt
	)
) ELSE (
	echo %date% %time% : The %file% doesn't exist.  >> log.txt
)