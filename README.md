# Enumerating-ICS-SCADA-Devices
This is a repository dedicated to discovering and enumerating industrial control and SCADA devices. Utilizing open-source tools, I have compiled scans and scripts for targeting Operational Technology (OT) devices and hosts! 

A brief desciption of each protocol:

  - BACnet (Building Automation and Control network) is a communication protocol used by building automation and control systems
  - Fox is a communication protocols most commonly used in building automation systems
  - Modbus is a communication protocol used by programmable logic controllers (PLC)
  
A table of ICS ports and protocols information:

<img width="1034" alt="Protocols" src="https://user-images.githubusercontent.com/72598486/132959686-be6a1469-a3bd-4575-9df6-f6a6b412d694.png">


In 2017, researchers scanned the internet for these devices, and here the number of devices they found utilzing each protocol:
  - Fox: 27k
  - Modbus: 23k
  - Bacnet: 16k

I wanted to publish this repository to aid in network professionals looking to secure ICS device, but WARNING, these scans have the ability to take down ICS devices! BE CAREFUL!

I have included an infographic on the MITRE Att&ck for ICS for anyone looking to understand ICS/SCADA exploitation:


![Mapping-of-Stuxnet-on-the-ATTCK-for-ICS-matrix-1-1024x532](https://user-images.githubusercontent.com/72598486/132959154-3258f30d-113d-452c-b33f-e12147798d4b.png)
