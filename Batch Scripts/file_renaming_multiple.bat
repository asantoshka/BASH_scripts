@echo off 
cd C:\Users\asant\OneDrive\Desktop
c:
set file=test test1 test2

(for %%a in (%file%) do ( 
   IF EXIST "%%a.txt" (
	ren %%a.txt %%a-%date%.txt
	IF EXIST "%%a-%date%.txt" (
		echo %date% %time% : %%a Backup created successfully  >> log.txt
	)
	) ELSE (
	echo %date% %time% : The %%a doesn't exist.  >> log.txt
	) 
))

