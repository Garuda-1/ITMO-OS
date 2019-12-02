net stop dnscache
ping localhost -n 6 >NUL
sc query | find /i "SERVICE_NAME" > services_updated.txt
start COMPARE_LOGS.cmd
net start dnscache
