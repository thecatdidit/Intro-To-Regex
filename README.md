# Intro-To-Regex

Contains all course files for the Pluralsight course Introduction to Regular Expression (Regex).


### Requirements


1 Virtual Machine
Operating System: Windows Server 2012R2|2016
CPU: 1 Core
RAM: 1 GB minimum Recommended 4GB
Disk Space: 32GB
PowerShell Version: 5.0+


### Lab Setup

In order to following along with the course, you'll need to setup the lab environment which consists of serveral active directory objects as well as
a windows event forwarding subscritpion and some file shares. All of the configuration setup is within the DSC configuration found under the directory
named DSC. Follow the below steps to apply the DSC configuration to your server.


1. Download the DSC configuration and configdata [IntroToRegex.ps1](https://github.com/Duffney/Intro-To-Regex/blob/master/DSC/IntroToRegex.ps1)  [IntroToRegex.psd1](https://github.com/Duffney/Intro-To-Regex/blob/master/DSC/IntroToRegex.psd1)
2. Open up the PowerShell ISE on server you wish to configure
3. Open _IntroToRegex.psd1_ within the PowerShell ISE
4. On line 1 of the _IntroToRegex.psd1_ file add `$configdata =` right before `@{`
5. Hit F5 to load the configdata into memory
6. Open _IntroToRegex.ps1_ within the PowerShell ISE and hit F5 to load the DSC configuration into memory
7. Within the command prompt within the PowerShell ISE type following command. 

`IntroToRegex -ConfigurationData $configdata -OutputPath C:\dsc\IntroToRegex`

8. Once prompted enter the administrator password
9. After the DSC configure runs you should have two .mof files at the location `C:\dsc\IntroToRegex`
10. Issue the below command to apply the DSC configure to the server 

`Start-DscConfiguration -Wait -Force -Path C:\dsc\IntroToRegex -Verbose`
