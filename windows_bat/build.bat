java.exe -jar .\toolkit\apktool\apktool.jar b .\decompiled\ -o .\build\unaligned.apk
.\toolkit\zipalign\Win\zipalign.exe -p -f -v 4 .\build\unaligned.apk .\build\aligned.apk
java.exe -jar .\toolkit\apksigner\apksigner.jar sign --cert .\toolkit\apksigner\cert\cert.x509.pem --key .\toolkit\apksigner\key\key.pk8 --out .\build\app_compiled.apk .\build\aligned.apk
@echo off
del .\build\unaligned.apk .\build\aligned.apk .\build\*.idsig
@echo on
pause
