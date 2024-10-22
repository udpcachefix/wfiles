# Windows 10 "1709-BTM.reg" & "1709-RIPPER.reg"
BTM is the safer and recommended version.
RIPPER will - yes will! - break a lot of things. Make sure you know what you're doing and have a few fixed at hand before applying.

Brief summary of what BTM does:

This registry file makes various changes to the Windows settings. Here's a brief summary of what it does:<br>
- Disables driver searching.<br>
- Disables User Account Control (UAC).<br>
- Disables automatic restart after updates.<br>
- Disables Windows consumer features.<br>
- Adjusts network throttling and system responsiveness settings.<br>
- Disables maintenance tasks.<br>
- Disables hibernate boot.<br>
- Disables power throttling.<br>
- Adjusts memory management settings.<br>
- Adjusts priority control settings.<br>
- Adjusts multimedia system profile settings for gaming.<br>
- Modifies visual effects settings.<br>
- Disables GameDVR features.<br>
- Disables GameDVR through policy settings.<br>
- Disables hibernation.<br>
- Modifies menu show delay.<br>
- Prevents device metadata retrieval from the network.<br>
- Excludes Windows Update drivers in quality updates.<br>
- Disables TSX (Transactional Synchronization Extensions) for certain Intel processors.<br>
- Modifies Ndu service startup.<br>
- Disables prefetcher.<br>
- Modifies Windows Search settings.<br>
- Disables telemetry data collection.<br>
- Modifies Windows Explorer settings for photo viewer.<br>
- Modifies Windows Update settings.<br>
- Modifies Windows activation settings.<br>
- Disables firewall and notification settings.<br>
- Disables Windows Update automatic updates.<br>
- Disables Windows Update reboot with logged-on users.<br>
- Modifies Windows Update URLs.<br>
- Disables minor updates installation.<br>
- Excludes recommended updates.<br>
- Disables Microsoft Removal Tool offers.<br>
- Disables OS upgrades.<br>
- Modifies network settings.<br>
- Disables MtcUvc service.<br>
- Modifies Photo Viewer file associations.<br>
- Disables Superfetch.<br>
- Modifies Security Health Service startup.<br>
- Modifies Windows Security Center service startup.<br>
- Modifies Windows Firewall settings.<br>

# Windows 10 1909 & Windows 10 2004 (1909.ps & 2004.ps)
This script sets the startup type of the services in the $automaticServices array to Automatic, the services in the $manualServices array to Manual, and all other services to Disabled. If a service is not found, Set-Service will throw an error, which you can ignore if the service is not installed on your system. If you want to suppress these errors, you can add -ErrorAction SilentlyContinue to the Set-Service commands.

# Windows 10 LTSC All-in-One (10-AIO.bat)
Technically, there is no need to "tweak" anything in LTSC, however, it just runs so smooth and that's all you want in Windows 10 LTSC.
