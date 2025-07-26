$devices = adb devices | Select-Object -Skip 1
if ($devices -match "device$") { exit 0 } else { exit 1 }
