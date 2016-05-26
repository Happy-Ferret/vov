#!/usr/bin/env bash

if [ -z "$ANDROID_SDK" ]; then
  echo "You must define ANDROID_SDK before starting. It should point to your SDK directories."
  exit 1
fi

./mkapk.bash debug || exit 1

${ANDROID_SDK}/platform-tools/adb install -r build/outputs/apk/vov-1.0-debug.apk

${ANDROID_SDK}/platform-tools/adb shell am start -a android.intent.action.MAIN -n com.github.gen2brain.vov/.MainActivity
