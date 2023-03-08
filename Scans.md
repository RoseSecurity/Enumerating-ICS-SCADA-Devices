# Repository of Scans For OT Devices:

## General Enumeration Against Common Ports

```
nmap -Pn -sT --scan-delay 1s --max-parallelism 1 -p 80,102,443,502,530,593,789,1089-1091,1911,1962,2222,2404,4000,4840,4843,4911,9600,19999,20000,20547,34962-34964,34980,44818,46823,46824,55000-55003 <target>
```

## Modbus Scanning

```
nmap -Pn -sT -p502 --script modbus-discover <target>

nmap -sT -Pn -p502 --script modbus-discover --script-args modbus-discover.aggressive=true <target>
```

## Metasploit Modbus Scanning

```
msf > use auxiliary/scanner/scada/modbusclient
msf auxiliary(modbusclient) > show actions
    ...actions...
msf auxiliary(modbusclient) > set ACTION < action-name >
msf auxiliary(modbusclient) > show options
    ...show and set options...
msf auxiliary(modbusclient) > run
```

## Metasploit Modbus Version Scanning

```
msf > use auxiliary/scanner/scada/modbusdetect
msf auxiliary(modbusdetect) > show actions
    ...actions...
msf auxiliary(modbusdetect) > set ACTION < action-name >
msf auxiliary(modbusdetect) > show options
    ...show and set options...
msf auxiliary(modbusdetect) > run
```

## Metasploit Modbus UnitID Enumeration

```
msf > use auxiliary/scanner/scada/modbus_findunitid
msf auxiliary(modbus_findunitid) > show actions
    ...actions...
msf auxiliary(modbus_findunitid) > set ACTION < action-name >
msf auxiliary(modbus_findunitid) > show options
    ...show and set options...
msf auxiliary(modbus_findunitid) > run
```

## Modbus Banner Grabbing

```
msf > use auxiliary/scanner/scada/modbus_banner_grabbing
msf auxiliary(modbus_banner_grabbing) > show options
    ... show and set options ...
msf auxiliary(modbus_banner_grabbing) > set RHOSTS ip-range
msf auxiliary(modbus_banner_grabbing) > exploit
```

## BACnet Scanning
```
nmap -Pn -sU -p47808 --script bacnet-info <target>
```
## Enip Enumeration
```
nmap -Pn -sU -p44818 --script enip-info <target>
```
## Niagara FOX Enumeration
```
nmap -Pn -sT -p1911,4911 --script fox-info <target>
```
## Omron Enumeration

```
nmap -Pn -sU -p9600 --script omrom-info <target>
```
    
## PCWorks Enumeration
    
PCWorx devices allow unaunthenticated requests that query for system information.

```
nmap -Pn -sT -p1962 --script pcworx-info <target>
```
