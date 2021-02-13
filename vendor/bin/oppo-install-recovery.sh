#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e9b27491286fd3536b13d8f62217d5f3c4b3dad1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:4f2c22a0fb0f3a1244ed72b8c82fe86301cd8a11 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e9b27491286fd3536b13d8f62217d5f3c4b3dad1 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
