# RevApk Toolkit
The RevApk Toolkit is a comprehensive collection of essential tools tailored for conducting fundamental reverse engineering tasks on Android applications (APKs). This toolkit comprises three core components, each contributing significantly to the reverse engineering process.

1. **APKTool**:
   - APKTool is a powerful and versatile tool created by Connor Tumbleson. It allows for the disassembling, modification, and reassembly of Android APKs. Use it to gain insights into an app's resources, code, and manifest, making it an invaluable asset for Android app developers, modders, and security enthusiasts.

2. **ZipAlign**:
   - ZipAlign, a part of the Android Open Source Project, optimizes APK files by aligning uncompressed .so libraries and resources, enhancing an app's performance and reducing memory usage. It's an essential step in preparing APKs for distribution on Android devices.

3. **APKSigner**:
   - APKSigner, developed by Max Weiner, is a vital tool for securing Android applications. It allows you to sign APKs with digital certificates, ensuring their integrity and authenticity. Properly signed APKs are essential for secure app distribution and updates.

The `apksigner` and `zipalign` utilities included in this toolkit is sourced directly from the Android SDK, further enhancing its credibility and reliability.

This toolkit is provided for educational purposes to aid developers, security researchers, and Android enthusiasts in exploring and understanding Android apps. It's important to note that the authors of these tools deserve credit for their contributions to the Android community.

**Disclaimer:**
The RevApk Toolkit is intended solely for educational purposes. Users are responsible for adhering to legal and ethical guidelines when using these tools. The toolkit's creator disclaims any responsibility for any misuse of the toolkit or its components.

**Credits:**
- APKTool: https://ibotpeaches.github.io/Apktool/
- ZipAlign: https://developer.android.com/tools/zipalign?hl=en
- APKSigner: https://developer.android.com/tools/apksigner?hl=en

## For Linux

### Grant execute permissions
```bash
chmod +x build.sh
chmod +x decompile.sh
```

### Build an APK
1. Place the directory with the resources of a previously decompiled application in the decompiled_apks directory and rename it to **decompiled**.
2. Run the script build.sh:
```bash
./build.sh
```

### Decompile an APK
## On Linux
1. Put the apk to decompile in apk/ directory and rename it to **app.apk**.
2. Run the script:
```bash
./decompile.sh
```
