Configuration IntroToRegex {
    param (
        [Parameter()] [ValidateNotNull()] [PSCredential] $Credential = (Get-Credential -Credential 'Administrator')        
    )

    Import-DscResource -Module PSDesiredStateConfiguration, xActiveDirectory;

node $AllNodes.Where({$true}).NodeName {

        LocalConfigurationManager {
            RebootNodeIfNeeded   = $true;
            AllowModuleOverwrite = $true;
            ConfigurationMode = 'ApplyOnly';
        }
        
        WindowsFeature ADDSTools {             
            Ensure = "Present"             
            Name = "RSAT-ADDS"             
        }

        File ADFiles            
        {            
            DestinationPath = 'C:\NTDS'            
            Type = 'Directory'            
            Ensure = 'Present'            
        }

        File Share {
            DestinationPath = 'C:\Share'
            Type = 'Directory'
            Ensure = 'Present'
        }

        foreach ($folder in $Node.Folders) {
            File $folder {
                DestinationPath = "C:\Share\$folder"
                Type = 'Directory'
                Ensure = 'Present'
            }
        }
                            
        WindowsFeature ADDSInstall             
        {             
            Ensure = "Present"             
            Name = "AD-Domain-Services"
            IncludeAllSubFeature = $true
            
        }
                
        xADDomain FirstDS            
        {             
            DomainName = $Node.DomainName             
            DomainAdministratorCredential = $Credential             
            SafemodeAdministratorPassword = $Credential            
            DatabasePath = 'C:\NTDS'            
            LogPath = 'C:\NTDS'            
            DependsOn = "[WindowsFeature]ADDSInstall","[File]ADFiles"            
        }

        xADUser SamSmith { 
            DomainName = $node.DomainName;
            UserName = 'ssmith';
            Surname = 'Sam'
            GivenName = 'Smith'            
            Description = 'Manager';
            Password = $Credential;
            Ensure = 'Present';
            DependsOn = '[xADDomain]FirstDS';
        }

        xADUser JasonGreen { 
            DomainName = $node.DomainName;
            UserName = 'jgreen';
            Ensure = 'Present';
            Surname = 'Jason'
            GivenName = 'Green'
            Manager = (Get-ADUser -Filter {name -like '*Smith*'}).DistinguishedName
            Password = $Credential
            DependsOn = '[xADDomain]FirstDS';
        }

        xADUser BrandonBailey { 
            DomainName = $node.DomainName;
            UserName = 'bbailey';
            Ensure = 'Present';
            Surname = 'Brandon'
            GivenName = 'Bailey'
            Manager = (Get-ADUser -Filter {name -like '*Smith*'}).DistinguishedName
            Password = $Credential
            DependsOn = '[xADDomain]FirstDS';
        }

        xADUser GraceBailey { 
            DomainName = $node.DomainName;
            UserName = 'gbailey';
            Ensure = 'Present';
            Surname = 'Grace'
            GivenName = 'Bailey'
            Manager = (Get-ADUser -Filter {name -like '*Smith*'}).DistinguishedName
            Password = $Credential
            DependsOn = '[xADDomain]FirstDS';
        }

        xADUser svc_account { 
            DomainName = $node.DomainName;
            UserName = 'svc_account';
            Ensure = 'Present';
            Surname = 'svc'
            GivenName = 'account'
            Password = $Credential
            DependsOn = '[xADDomain]FirstDS';
        }

        xADGroup Sales {
            GroupName = 'Sales'
            Ensure = 'Present'
            Members = 'jgreen' 
        }

        xADGroup SalesManagers {
            GroupName = 'SalesManagers'
            Ensure = 'Present'
            Members = 'ssmith' 
        }

        xADGroup SalesEngineers {
            GroupName = 'SalesEngineers'
            Ensure = 'Present'
            Members = 'gbailey','bbailey' 
        }        
}


} #end Configuration Example