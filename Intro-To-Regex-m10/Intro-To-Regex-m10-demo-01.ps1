(cmd /c wecutil gs appevents | Out-String) -replace '(?ns)(.*)Address:\s(?<ServerName>\w+)(.*)','$1'
(cmd /c wecutil gs appevents | Out-String) -replace '(?s)(?:.*)Address:\s(\w+)(?:.*)','$1'
