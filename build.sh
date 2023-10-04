#!/bin/bash
#
# This bash shell script has been created to compile
# modified applications from their previously decompiled
# source code using the decompile.sh script.
#

# DEFINE APK OUTPUT FILE NAME
APK_BUILD_FILENAME="app"

# DEFINE DEFAULT DECOMPILE PATH DIRECTORY
DECOMPILE_SRC_PATH="./decompiled_apks/decompiled"

# DEFINE ALIGNED APK OUTPUT FILE NAME
ALIGNED_APK_NAME="aligned"

# DEFINE UNALIGNED APK OUTPUT FILE NAME
UNALIGNED_APK_NAME="unaligned"

# DEFINE DEFAULT BUILD PATH
BUILD_PATH="./build"

# DEFINE APK FILE EXTENSION
APK_EXTENSION="apk"

# RESOLVE APK UNLIGNED PATH
UNALIGNED_OUTPUT_PATH="${BUILD_PATH}/${UNALIGNED_APK_NAME}.${APK_EXTENSION}"

# RESOLVE APK ALIGNED PATH
ALIGNED_OUTPUT_PATH="${BUILD_PATH}/${ALIGNED_APK_NAME}.${APK_EXTENSION}"

# RESOLVE APK BUILD PATH
APK_BUILD_PATH="${BUILD_PATH}/${APK_BUILD_FILENAME}.${APK_EXTENSION}"

##
# Run a JAR (Java Archive) package with specified parameters using the Java Virtual Machine (JVM).
#
# @param {path} JAR file - The path to the JAR package you want to execute.
# @param {args} Arguments - Additional arguments or parameters needed by the JAR package.
#
runJarPackage() {
    java -jar $@
}

##
# Function to run APKTool java package
#
# APKTool is a powerful command-line utility for reverse engineering and modifying Android
# application packages (APKs). It allows you to decode, modify, and rebuild APKs, making it
# a valuable tool for Android app development and analysis.
# For more information and usage instructions, refer to the official APKTool documentation:
# https://ibotpeaches.github.io/Apktool/
#
# @param {option} Build flag - The flag to specify the compilation operation
# @param {path} Decode SRC path - The path where the application resources are located
# @param {option} Ouput flag - The flag to specify the path/filename of the output
# @param {path} Output path - The path where the output unligned apk will be saved
#
APKTOOL_PATH="./toolkit/apktool/apktool_2.8.1.jar"
APKTOOL_BUILD_FLAG="b"
APKTOOL_OUTPUT_FLAG="-o"

runAPKTool() {
    runJarPackage $APKTOOL_PATH $APKTOOL_BUILD_FLAG $DECOMPILE_SRC_PATH $APKTOOL_OUTPUT_FLAG $UNALIGNED_OUTPUT_PATH
}

##
# Function to run ZipAlign utility
#
# ZipAlign is an Android optimization tool that aligns and optimizes files within an APK
# for improved performance on mobile devices. It aligns uncompressed .so libraries and
# other resources for more efficient execution. Refer to the Android documentation for
# further details: https://developer.android.com/studio/command-line/zipalign
#
# @param {flag} Page-Align Flag - page-align uncompressed .so files
# @param {flag} Overwrite Flag - overwrite existing outfile.zip
# @param {flag} Verbose Flag - verbose output
# @param {Nmber} align - alignment in bytes, e.g. '4' provides 32-bit alignment
# @param {path} unaligned path
# @param {path} aligned output path
#
# USE ZIPALIGN LINUX X64 VERSION
ZIPALIGN="./toolkit/zipalign/Linux/zipalign"
VERBOSE_FLAG="-v"
OVERWRITE_FLAG="-f"
PAGEALIGN_FLAG="-p"
ALIGN_BYTES="4"

runZipAlign() {
    $ZIPALIGN $PAGEALIGN_FLAG $OVERWRITE_FLAG $VERBOSE_FLAG $ALIGN_BYTES $UNALIGNED_OUTPUT_PATH $ALIGNED_OUTPUT_PATH
}

##
# Function to run apksigner
#
# `apksigner` is a command-line tool provided by the Android SDK for signing Android
# application packages (APKs). It plays a crucial role in the Android app signing process,
# ensuring the integrity and authenticity of the APK. Developers use it to sign their apps
# with digital certificates, which is necessary for app distribution and security.
# For detailed usage and documentation, refer to the official Android documentation:
# https://developer.android.com/studio/publish/app-signing
#
APKSIGNER_PATH="./toolkit/apksigner/apksigner.jar"
SIGNER_KEY_PATH="./toolkit/apksigner/key/key.pk8"
SIGNER_CERTIFICATE_PATH="./toolkit/apksigner/cert/cert.x509.pem"

runApkSigner() {
    runJarPackage $APKSIGNER_PATH sign --cert $SIGNER_CERTIFICATE_PATH --key $SIGNER_KEY_PATH --out $APK_BUILD_PATH $ALIGNED_OUTPUT_PATH
}

##
# Function to clean residual files
#
cleanResidualFiles() {
    rm $UNALIGNED_OUTPUT_PATH $ALIGNED_OUTPUT_PATH $BUILD_PATH/*.idsig
}

##
# APK Build Process
#
buildApk() {
    runAPKTool
    runZipAlign
    runApkSigner
    cleanResidualFiles
}

##
# run build command
#
buildApk
