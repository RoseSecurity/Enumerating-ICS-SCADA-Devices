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

File Hashes:

```
FD9C17C35A68FC505235E20C6E50C622AED8DEA0;Industroyer2 Report - 108_100.exe Win32/Industroyer.B Industroyer2 - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
6FA04992C0624C7AA3CA80DA6A30E6DE91226A16;Industroyer2 Report - zrada.exe Win32/Agent.AECG ArguePatch - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
9CE1491CE69809F92AE1FE8D4C0783BD1D11FBE7;Industroyer2 Report - pa.pay N/A TailJump (Encrypted CaddyWiper) - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
0090CB4DE31D2D3BCA55FD4A36859921B5FC5DAE;Industroyer2 Report - link.ps1 PowerShell/HackTool.Agent.AH Script which enumerates GPO - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
D27D0B9BB57B2BAB881E0EFB97C740B7E81405DF;Industroyer2 Report - sc.sh Linux/Agent.PC trojan OrcShred (Linux worm) - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
3CDBC19BC4F12D8D00B81380F7A2504D08074C15;Industroyer2 Report - wobf.sh Linux/KillFiles.C trojan AwfulShred (Linux wiper) - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
8FC7646FA14667D07E3110FE754F61A78CFDE6BC;Industroyer2 Report - wsol.sh Linux/KillFiles.B trojan SoloShred (Solaris wiper) - https://www.welivesecurity.com/2022/04/12/industroyer2-industroyer-reloaded/
```
