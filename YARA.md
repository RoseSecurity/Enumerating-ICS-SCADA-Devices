# YARA Rules for Detection:

## Industroyer2:

Industroyer2 only implements the IEC-104 (aka IEC 60870-5-104) protocol to communicate with industrial equipment. This includes protection relays, used in electrical substations. This is a slight change from the 2016 Industroyer variant that is a fully-modular platform with payloads for multiple ICS protocols.

```
rule Industroyer2
{

    meta:
        author = "CERT-UA, ESET, and RoseSecurity"
        info = "Industroyer2 malware targeting power grid components"
        date = "2022-04-12"
        hash1 = "FD9C17C35A68FC505235E20C6E50C622AED8DEA0"
        
    strings:
        $x1 = "108_100.exe" fullword ascii
        $x2 = "cdel.exe" fullword ascii
        $x3 = "C:\Users\peremoga.exe" fullword ascii
        $s1 = "\\%DOMAIN%\sysvol\%DOMAIN%\Policies\%GPO" wide ascii
        $s2 = "MiniDump %PID%" wide ascii
        $s3 = "reg save HKLM\SAM" wide ascii
        $s4 = "pa1.pay" wide ascii

    condition:
        (1 of ($x*) and all of ($s*))
}
```
Filenames:

```
# Filename IOCs mentioned in Industroyer2 Report https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
\\108_100\.exe;85
\\zrada\.exe;75
\\pa\.pay$;65
\\link\.ps1;60
\\sc\.sh$;65
\\wobf\.sh;80
\\wsol\.sh;80
```
