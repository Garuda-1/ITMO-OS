echo off

type nul > deleted.log

for /f "skip=1" %%F in ('dir /b /o-d *.txt') do (
	@echo Deleting %%F >> deleted.log
	@del %%F
)