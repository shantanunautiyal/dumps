#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fdc2e8e845803a858b688b13f208c1669acdc8a6; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:540ba2dba80f3bda0810cd7274b6a1db08686dfa \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fdc2e8e845803a858b688b13f208c1669acdc8a6 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
