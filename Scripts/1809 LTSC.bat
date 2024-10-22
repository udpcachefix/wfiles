MODE CON: COLS=78 LINES=55
CLS
@ECHO OFF
:START_MENU
COLOR C
CLS
Echo. 
Echo.  You are about to make a Full Registry Backup
Echo. 

set /p registry= "Do you want to make Full Registry Backup? y/n: "
if '%registry%' == 'n' goto :SysRestore
if /i "%registry%" neq "y" goto RegistryBackup

:RegistryBackup
regedit /e "%USERPROFILE%\Desktop\FullRegistryBackup%now%.reg"
Echo. 
Echo. 
Echo. 
Echo. Full Registry Backup Done. Check Your Desktop 

:SysRestore
Echo. 
Echo.Making System Restore Point before do any changes to your system .....
Echo. 
Echo.Press OK to continue ...
Wscript.exe "RestorePointFile.vbs"
systempropertiesprotection
Echo. 
Echo. After you are done Press Any Key
pause

ECHO.
ECHO. ****************************************************************************
ECHO. *                              n1kobg tweaks                               *
ECHO. *               OPTIMIZE YOUR SYSTEM TO INCREASE PERFORMANCE               *
ECHO. *                                                                          *
ECHO. *                      https://n1kobg.blogspot.bg/                         *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                                OPTIONS                                   *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *              Press "O" to GO to System Optimization                      *
ECHO. *              Press "N" to GO to Network_Optimization                     *
ECHO. *              Press "A" to GO to ACTIVATE SERVICE_OPTIMIZE                *
ECHO. *              Press "T" to GO to ADDITIONAL_TWEAKS                        *
ECHO. *              Press "C" to GO to CONTROVERSIAL_TWEAKS                     *
ECHO. *              Press "U" to GO to WINDOWS_UPDATE                           *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice=  Your choice:  
IF /I "%choice%"=="O" GOTO SYSTEM_OPTIMIZE
IF /I "%choice%"=="N" GOTO Network_Optimization
IF /I "%choice%"=="A" GOTO SERVICE_OPTIMIZE
IF /I "%choice%"=="T" GOTO ADDITIONAL_TWEAKS
IF /I "%choice%"=="C" GOTO CONTROVERSIAL_TWEAKS
IF /I "%choice%"=="U" GOTO WINDOWS_UPDATE
:: ELSE
GOTO START_MENU

:SYSTEM_OPTIMIZE
COLOR C
CLS
ECHO.
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *                        OPTIMIZE SYSTEM PERFORMANCE                       *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                       https://n1kobg.blogspot.bg/                        *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *           Press (O) to Optimize Windows for maximum performance          *
ECHO. *           Press (M) to Go to START_MENU                                  *
ECHO. *           Press (S) to Skip                                              *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice= Your choice:
IF /I "%choice%"=="O" GOTO Windows_Optimize
IF /I "%choice%"=="M" GOTO START_MENU
IF /I "%choice%"=="S" GOTO Network_Optimization
:: ELSE
GOTO SYSTEM_OPTIMIZE

:Windows_Optimize
powercfg -h off
bcdedit /timeout 3
fsutil behavior set disablelastaccess 1
bcdedit /set {current} quietboot Yes
bcdedit /set {current} nx AlwaysOff
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

Echo. For Windows versions bellow v1803. You need the Ultimate_Performance.pow file in the folder.
copy Ultimate_Performance.pow C:\Users\%username%\Desktop
powercfg -import "C:\Users\%Username%\Desktop\Ultimate_Performance.pow"
del C:\Users\%username%\Desktop\Ultimate_Performance.pow

ECHO. ********************************************
Echo. Enable MSI-Mode for GPUs! 10x to st1cky* :) 
ECHO. ********************************************
for /f %%i in ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v MSISupported /t REG_DWORD /d 00000001 /f

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperFetch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "134217728" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DisableDeleteNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsAllowExtendedCharacter8dot3Rename" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsBugcheckOnCorrupt" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableCompression" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsEncryptPagingFile" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMemoryUsage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "UdfsSoftwareDefectManagement" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "Win31FileSystem" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "FileNameCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "PathCache" /t REG_DWORD /d "128" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "ContigFileAllocSize" /t REG_DWORD /d "1536" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "DisableDeleteNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsAllowExtendedCharacter8dot3Rename" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsBugcheckOnCorrupt" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsDisableCompression" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsDisableEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsEncryptPagingFile" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsMemoryUsage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "UdfsSoftwareDefectManagement" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "Win31FileSystem" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "FileNameCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "PathCache" /t REG_DWORD /d "128" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "ContigFileAllocSize" /t REG_DWORD /d "1536" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "SynchronousUserGroupPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "SynchronousMachineGroupPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "ActiveWndTrkTimeout" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "PaintDesktopVersion" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SystemStartOptions" /t REG_SZ /d " NOEXECUTE=OPTIN  NOGUIBOOT  BOOTLOGO" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "DirtyShutdownCount" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\LanmanWorkstation\Parameters" /v "MaxCollectionCount" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\LanmanWorkstation\Parameters" /v "MaxThreads" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "AutoChkTimeOut" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI" /v "ButtonSet" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportinfectioninformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoWindowMinimizingShortcuts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "forceguest" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "Enable" /t REG_SZ /d "N" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableStartupSound" /t REG_DWORD /d "1" /f

Echo. Right Click Menu
Reg.exe add "HKCR\DesktopBackground\Shell\KillNotResponding" /v "MUIVerb" /t REG_SZ /d "Kill not responding tasks" /f
Reg.exe add "HKCR\DesktopBackground\Shell\KillNotResponding" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\\System32\\imageres.dll,-98" /f
Reg.exe add "HKCR\DesktopBackground\Shell\KillNotResponding" /v "Position" /t REG_SZ /d "Top" /f
Reg.exe add "HKCR\DesktopBackground\Shell\KillNotResponding\Command" /ve /t REG_SZ /d "cmd.exe /K taskkill.exe /F /FI \"status eq NOT RESPONDING\"" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan" /v "MUIVerb" /t REG_SZ /d "Switch Power Plan" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan" /v "SubCommands" /t REG_SZ /d "" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Balanced" /v "MUIVerb" /t REG_SZ /d "Balanced" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Balanced" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Balanced\Command" /ve /t REG_SZ /d "powercfg.exe /S 381b4222-f694-41f0-9685-ff5bb260df2e" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\High Performance" /v "MUIVerb" /t REG_SZ /d "High Performance" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\High Performance" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\High Performance\Command" /ve /t REG_SZ /d "powercfg.exe /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Power Saver" /v "MUIVerb" /t REG_SZ /d "Power Saver" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Power Saver" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Power Saver\Command" /ve /t REG_SZ /d "powercfg.exe /S a1841308-3541-4fab-bc81-f71556f20b4a" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Ultimate Performance" /v "MUIVerb" /t REG_SZ /d "Ultimate Performance For Workstations" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Ultimate Performance" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\Ultimate Performance\Command" /ve /t REG_SZ /d "powercfg.exe /S e9a42b02-d5df-448d-aa00-03f14749eb61" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\01PowerOptions" /v "MUIVerb" /t REG_SZ /d "Power options" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\01PowerOptions\command" /ve /t REG_SZ /d "control /name Microsoft.PowerOptions" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\02Editcurrentplan" /v "MUIVerb" /t REG_SZ /d "Edit current power plan" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Switch Power Plan\Shell\02Editcurrentplan\command" /ve /t REG_SZ /d "control /name Microsoft.PowerOptions /page pagePlanSettings" /f

Echo.  UNLOCKING POWER SETTINGS
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0300F6F8-ABD6-45a9-B74F-4908691A40B5" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\68dd2f27-a4ce-4e11-8487-3794e4135dfa" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\77D7F282-8F1A-42cd-8537-45450A839BE8" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\99B3EF01-752F-46a1-80FB-7730011F2354" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\df142941-20f3-4edf-9a4a-9c83d3d717d1" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\68f262a7-f621-4069-b9a5-4874169be23c" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bbdc3814-18e9-4463-8a55-d197327c45c0" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\df142941-20f3-4edf-9a4a-9c83d3d717d1" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\68dd2f27-a4ce-4e11-8487-3794e4135dfa" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8f7b45e3-c393-480a-878c-f67ac3d07082" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5b33697b-e89d-4d38-aa46-9e7dfb7cd2f9" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e70867f1-fa2f-4f4e-aea1-4d8a0ba23b20" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1299023c-bc28-4f0a-81ec-d3295a8d815d" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9ac18e92-aa3c-4e27-b307-01ae37307129" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8809c2d8-b155-42d4-bcda-0d345651b1db" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\a55612aa-f624-42c6-a443-7397d064c04f" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94d3a615-a889-4ac5-ae2b-e4d8f634367f" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\82DBCF2D-CD67-40C5-BFDC-9F1A5CCD4663" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\EED904DF-B142-4183-B10B-5A1197A37864" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "Attributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "Attributes" /t REG_DWORD /d "0" /f

GOTO Network_Optimization


:Network_Optimization
COLOR C
CLS
ECHO.
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *              OPTIMIZE YOUR CONNECTION AND FIX YOUR HIT-REG               *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                      https://n1kobg.blogspot.bg/                         *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *                Press "N" to Activate_Network_Optimization                *
ECHO. *                Press "M" to GO to START_MENU                             *
ECHO. *                Press "S" to Skip                                         *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice= Your choice:
IF /I "%choice%"=="N" GOTO Activate_Network_Optimization
IF /I "%choice%"=="M" GOTO START_MENU
IF /I "%choice%"=="S" GOTO SERVICE_OPTIMIZE
:: ELSE
GOTO START_MENU

:Activate_Network_Optimization
Echo. winsock command are request from jack37*
netsh winsock reset

netsh interface teredo set state disabled
netsh interface 6to4 set state disabled
netsh interface isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=disable

Echo. next one works for v1703 and lower"
netsh int tcp set global congestionprovider=ctcp

netsh int tcp set supplemental Internet congestionprovider=CTCP
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=disabled

PowerShell Disable-NetAdapterQos -Name "*"
PowerShell Disable-NetAdapterLso -Name "*"
PowerShell Disable-NetAdapterRsc -Name "*"
PowerShell Disable-NetAdapterChecksumOffload -Name "*"
PowerShell Disable-NetAdapterPowerManagement -Name "*"
PowerShell Disable-NetAdapterIPsecOffload -Name "*"

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoNetCrawling" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "5840" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "5840" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "5840" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "5840" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpAckFrequency /t REG_DWORD /d 0000001 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpDelAckTicks /t REG_DWORD /d 0000000 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TCPNoDelay /t REG_DWORD /d 0000001 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v InterfaceMetric /t REG_DWORD /d 0000055 /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\NetBT\Parameters" /v "NameSrvQueryTimeout" /t REG_DWORD /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcachettl" /t REG_DWORD /d "13824" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxnegativecachettl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableBucketSize" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheEntryTtlLimit" /t REG_DWORD /d "86400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxSOACacheEntryTtlLimit" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableSize" /t REG_DWORD /d "384" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "Class" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS" /t REG_DWORD /d "0" /f


GOTO SERVICE_OPTIMIZE

:SERVICE_OPTIMIZE
COLOR C
CLS
ECHO.
ECHO. ****************************************************************************
ECHO. *                   Disabling Useless Windows 10 Services                  *
ECHO. *                        Freeing System Resources                          *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                      https://n1kobg.blogspot.bg/                         *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *                 Press "W" to DISABLE_WIN_APPS (except calculator)        *
ECHO. *                 Press "A" to ACTIVATE SERVICE_OPTIMIZE                   *
ECHO. *                 Press "D" to DISABLE_WIN_STORE                           *
ECHO. *                 Press "M" to GO to START_MENU                            *
ECHO. *                 Press "P" to Disable_DataCollection_Privacy_Telemetry    *
ECHO. *                 Press "S" to  Skip                                       *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice= Your choice:
IF /I "%choice%"=="W" GOTO DISABLE_WIN_APPS
IF /I "%choice%"=="A" GOTO ACTIVATE_SERVICE_OPTIMIZE
IF /I "%choice%"=="D" GOTO DISABLE_WIN_STORE
IF /I "%choice%"=="M" GOTO START_MENU
IF /I "%choice%"=="S" GOTO ADDITIONAL_TWEAKS
IF /I "%choice%"=="P" GOTO Disable_DataCollection_Privacy_Telemetry
:: ELSE
GOTO ADDITIONAL_TWEAKS

:DISABLE_WIN_APPS
powershell “Get-AppxPackage *BingFinance* | Remove-AppxPackage”
powershell “Get-AppxPackage *BingNews* | Remove-AppxPackage”
powershell “Get-AppxPackage *BingSports* | Remove-AppxPackage”
powershell “Get-AppxPackage *BingWeather* | Remove-AppxPackage”
powershell “Get-AppxPackage *Getstarted* | Remove-AppxPackage”
powershell “Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage”
powershell “Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage”
powershell “Get-AppxPackage *Office.OneNote* | Remove-AppxPackage”
powershell “Get-AppxPackage *People* | Remove-AppxPackage”
powershell “Get-AppxPackage *SkypeApp* | Remove-AppxPackage”
powershell “Get-AppxPackage *Windows.Photos* | Remove-AppxPackage”
powershell “Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage”
powershell “Get-AppxPackage *WindowsCamera* | Remove-AppxPackage”
powershell “Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage”
powershell “Get-AppxPackage *WindowsMaps* | Remove-AppxPackage”
powershell “Get-AppxPackage *WindowsPhone* | Remove-AppxPackage”
powershell “Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage”
powershell “Get-AppxPackage *XboxApp* | Remove-AppxPackage”
powershell “Get-AppxPackage *ZuneMusic* | Remove-AppxPackage”
powershell “Get-AppxPackage *ZuneVideo* | Remove-AppxPackage”
powershell “Get-AppxPackage *3DBuilder* | Remove-AppxPackage”

GOTO SERVICE_OPTIMIZE

:DISABLE_WIN_STORE
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /t REG_DWORD /d "1" /f

GOTO SERVICE_OPTIMIZE

:ACTIVATE_SERVICE_OPTIMIZE
ECHO j | net stop Spooler
sc config "Spooler" start=disabled
ECHO j | net stop W32Time
sc config "W32Time" start=disabled
ECHO j | net stop TermService
sc config "TermService" start=disabled

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\AxInstSV" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WinRM" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\TrkWks" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\rdbss" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\pcmcia" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\luafv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\lltdio" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\hwpolicy" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\CSC" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\vdrvroot" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\tcpipreg" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\storflt" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\srvnet" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\rspndr" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\Psched" /v "DisabledComponents" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DEFRAGSVC" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MessagingService_1c6e8" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\RasAgileVpn" /v "DisabledComponents" /t REG_DWORD /d "4" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MapsBroker" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\iphlpsvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\ALG" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AppMgmt" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PeerDistSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CertPropSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\irmon" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MSiSCSI" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NaturalAuthentication" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Netlogon" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RpcLocator" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RetailDemo" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SCPolicySvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMPTRAP" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\wcncsvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\wisvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WinRM" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WwanSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\xbgm" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\XblAuthManager" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\XboxNetApiSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\XblGameSave" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SessionEnv" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TermService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\UmRdpService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AJRouter" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BthHFSrv" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\bthserv" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\dmwappushsvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HvHost" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmickvpexchange" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicguestinterface" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicshutdown" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicheartbeat" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicvmsession" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicrdv" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\IpxlatCfgSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SmsRouter" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CscService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SEMgrSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PhoneSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SensorDataService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SensrSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SensorService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\ScDeviceEnum" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TabletInputService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WebClient" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WFDSConSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\FrameServer" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\icssvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\lfsvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NcdAutoSetup" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NfsClnt" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WMPNetworkSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WlanSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\lmhosts" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CscService" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CertPropSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\msahci" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\p2pimsvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PcaSvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PNRPsvc" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RemoteRegistry" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HomeGroupListener" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HomeGroupProvider" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SENS" /v Start /t REG_DWORD /d 00000004 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SysMain" /v Start /t REG_DWORD /d 00000004 /f

Ehco. If you want to disable Scheduler make it 4. This will stop all programs from loading on boot.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v Start /t REG_DWORD /d 00000003 /f


GOTO SERVICE_OPTIMIZE


:Disable_DataCollection_Privacy_Telemetry
sc stop dmwappushservice
net stop dmwappushservice 
sc config dmwappushservice start= disabled
net stop diagnosticshub.standardcollector.service > NUL 2>&1
sc config diagnosticshub.standardcollector.service start= disabled

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "DiagnosticErrorText" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticErrorText" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticLinkText" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\WMDRM" /v "DisableOnline" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CredUI" /v "DisablePasswordReveal" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "DoNotTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "OptimizeWindowsSearchResultsForScreenReaders" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FlipAhead" /v "FPEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\User\Default\SearchScopes" /v "ShowSearchSuggestionsGlobal" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Browser" /v "AllowAddressBarDropdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Privacy" /v "EnableEncryptedMediaExtensions" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971f918-a847-4430-9279-4a52d1efe18d" /v "RegisteredWithAU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\OneDrive" /v "PreventNetworkTrafficPreUserSignIn" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"

schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable

schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM"

schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable

schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"

schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable

schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"

schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable

schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader"

schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable

schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"

schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable

schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"

schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable

schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask"

schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable"

schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"

schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable

schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"

schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable

schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"

schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable

schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"

schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable

schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh"

schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable

schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload"

schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable

schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy"

schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable

schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT"

schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable

schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent"

schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable

schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting"

schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable

schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"

schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable

schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics"

schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable

schtasks /end /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)"

schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable

schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks"

schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable

schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"

schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable

schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific"

schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /disable

schtasks /Change /TN "Microsoft\Windows\SettingSync\BackgroundUploadTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\ApplicationData\CleanupTemporaryState" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\ApplicationData\DsSvcCleanup" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\HypervisorFlightingTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Multimedia\SystemSoundsService" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Offline Files\Background Synchronization" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Offline Files\Logon Synchronization" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\SettingSync\BackupTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Wininet\CacheTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /Disable > NUL 2>&1
schtasks /Change /TN "Driver Easy Scheduled Scan" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /Disable > NUL 2>&1


GOTO SERVICE_OPTIMIZE

:ADDITIONAL_TWEAKS
COLOR C
CLS
ECHO.
ECHO. ****************************************************************************
ECHO. *                            ADDITIONAL_TWEAKS                             *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                       https://n1kobg.blogspot.bg/                        *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *                 Press "T" to ACTIVATE_ADDITIONAL_TWEAKS                  *
ECHO. *                 Press "M" to GO to START_MENU                            *
ECHO. *                 Press "S" to  Skip                                       *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice= Your choice:
IF /I "%choice%"=="T" GOTO ACTIVATE_ADDITIONAL_TWEAKS
IF /I "%choice%"=="M" GOTO START_MENU
IF /I "%choice%"=="S" GOTO CONTROVERSIAL_TWEAKS
:: ELSE
GOTO START_MENU

:ACTIVATE_ADDITIONAL_TWEAKS
echo. Disable AutoLaunch Feature
for /F "tokens=* skip=1" %%n in ('wmic useraccount where "name='%username%'" get sid ^| findstr "."') do (set SID=%%n)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\%SID%" /v OptOut /t REG_DWORD /d 1 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "restrictanonymous" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "restrictanonymoussam" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LastActiveClick" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f

Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailsOnNetworkFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TaskbarNoNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d "221" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f

Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoWindowMinimizingShortcuts" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d "16384" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f

Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_DWORD /d "0" /f

Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "AutoApproveOSDumps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "100" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "RunStartupScriptSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer" /v "GlobalAssocChangedCounter" /t REG_DWORD /d "91" /f


GOTO CONTROVERSIAL_TWEAKS

:CONTROVERSIAL_TWEAKS
COLOR C
CLS
ECHO.
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *       These tweaks affects DVR, Defender, Cortana and OnOneDrive         *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *                Press "B" to Disable Cortana and Search Indexing          *
ECHO. *                PRESS "1" TO Disable OnOneDrive                           *
ECHO. *                PRESS "F" TO Disable Defender and asks for Firewall       *
ECHO. *                PRESS "V" TO Disable Game DVR                             *
ECHO. *                PRESS "M" GOTO START MENU                                 *
ECHO. *                PRESS "S" TO SKIP                                         *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice= Your choice:
IF /I "%choice%"=="B" GOTO Disable_Cortana_and_Search_Indexing
IF /I "%choice%"=="1" GOTO Disable_OnOneDrive
IF /I "%choice%"=="F" GOTO Disable_Defender
IF /I "%choice%"=="V" GOTO Disable_Game_DVR
IF /I "%choice%"=="M" GOTO START_MENU
IF /I "%choice%"=="S" GOTO WINDOWS_UPDATE
:: ELSE
GOTO :WINDOWS_UPDATE

:Disable_Game_DVR
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f

GOTO CONTROVERSIAL_TWEAKS


:Disable_Defender
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f

ECHO.
ECHO.
ECHO. Do you Want to Disable the Firewall (if you are not sure press "n") ?
SET /P choice=  Your choice:  
IF /I "%choice%"=="Y" GOTO Disable_Defernder_Firewall
IF /I "%choice%"=="N" GOTO CONTROVERSIAL_TWEAKS

:Disable_Defernder_Firewall
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mpsdrv" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "4" /f

GOTO CONTROVERSIAL_TWEAKS


:Disable_OnOneDrive
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableLibrariesDefaultSaveToOneDrive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSync" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableMeteredNetworkFileSync" /t REG_DWORD /d "0" /f

GOTO CONTROVERSIAL_TWEAKS


:Disable_Cortana_and_Search_Indexing
sc stop "WSearch"
sc config "WSearch" start=disabled
Echo.This rule prevents the Cortana telemetry. Also will disable Cortana voice recognition. Need Firewall enabled.
netsh advfirewall firewall add rule name="SearchUI.exe Telemetry" dir=out action=block program="%SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy\SearchUI.exe"

Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f

GOTO CONTROVERSIAL_TWEAKS

:WINDOWS_UPDATE
COLOR C
CLS
ECHO.
ECHO. ****************************************************************************
ECHO. *                             WINDOWS_UPDATE                               *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO. *                                                                          *
ECHO. *                PRESS "J" TO :OPTIMIZE_WINDOWS_UPDATE                     *
ECHO. *                PRESS "U" TO :DISABLE_WINDOWS_UPDATE                      *
ECHO. *                PRESS "M" GOTO START_MENU                                 *
ECHO. *                PRESS "S" TO SKIP                                         *
ECHO. *                                                                          *
ECHO. ****************************************************************************
ECHO.
SET /P choice= Your choice:
IF /I "%choice%"=="J" GOTO :OPTIMIZE_WINDOWS_UPDATE 
IF /I "%choice%"=="U" GOTO :DISABLE_WINDOWS_UPDATE
IF /I "%choice%"=="M" GOTO START_MENU
IF /I "%choice%"=="S" GOTO :Prep
:: ELSE
GOTO :Prep

:DISABLE_WINDOWS_UPDATE
ECHO j | net stop bits
ECHO j | net stop cryptSvc
ECHO j | net stop msiserver
ECHO j | net stop UsoSvc
ECHO j | net stop wuauserv
sc config "UsoSvc" start=disabled
sc config "wuauserv" start=disabled
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\UX\Settings" /v "DeferUpgrade" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971f918-a847-4430-9279-4a52d1efe18d" /v "RegisteredWithAU" /t REG_DWORD /d "0" /f

GOTO WINDOWS_UPDATE


:OPTIMIZE_WINDOWS_UPDATE
sc config "wuauserv" start=demand
sc config "bits" start=demand
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\UX\Settings" /v "DeferUpgrade" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971f918-a847-4430-9279-4a52d1efe18d" /v "RegisteredWithAU" /t REG_DWORD /d "0" /f


GOTO WINDOWS_UPDATE

goto Prep

:Prep
    SET count=9
    SET genericMessage=    Restart PC to Fix Your Hit-Reg and visit my blog:   n1kobg.blogspot.bg     

    goto Output

:Output
    IF NOT %count% == -1 (
        cls
        IF %count% == 0 (
            echo %genericMessage% Closing.
        ) ELSE (
            echo %genericMessage% Closing in %count% seconds.
        )
        SET /A count=%count% - 1
        ping localhost -n 2 >nul
        goto Output
    ) ELSE (
        exit
    )