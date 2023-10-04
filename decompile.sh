#!/bin/bash
#
# This bash shell script has been created to decompile
# android packages(APK).
#

# DEFINE APK PATH TO DECOMPILE
APK_SRC_PATH="apk/app.apk"

# DEFINE DEFAULT DECOMPILE PATH DIRECTORY
DECOMPILED_OUTPUT_PATH="./decompiled_apks/decompiled/"

# DEFINE APK FILE EXTENSION
APK_EXTENSION="apk"

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
APKTOOL_DECODE_FLAG="d"
APKTOOL_FORCE_FLAG="-f"
APKTOOL_OUTPUT_FLAG="-o"

runAPKTool() {
    runJarPackage $APKTOOL_PATH $APKTOOL_FORCE_FLAG $APKTOOL_DECODE_FLAG $APK_SRC_PATH $APKTOOL_OUTPUT_FLAG $DECOMPILED_OUTPUT_PATH
}

##
# APK decompile Process
#
decompileApk() {
    runAPKTool
}

##
# run decompile command
#
decompileApk
