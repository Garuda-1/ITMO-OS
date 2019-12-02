for /F %%F in ('dir C:\LAB6\TASK2\cd /B') do (
	@xcopy C:\LAB6\TASK2\cd\%%F \\vboxsrv\WinXP_Shared\temp /YZ
)