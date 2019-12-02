type nul > version.txt
type nul > memory.txt
type nul > disks.txt

wmic os get caption, csdversion, version | more >> version.txt

wmic computersystem get totalphysicalmemory | more >> memory.txt
wmic os get freephysicalmemory | more >> memory.txt

wmic logicaldisk list brief | more >> disks.txt