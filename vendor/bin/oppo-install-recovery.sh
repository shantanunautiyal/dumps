#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:cfd3ca989588c785639e78b95d85cddc972559d9; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:a5d94e67811f55e05be173b432cf556fea44cef8 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:cfd3ca989588c785639e78b95d85cddc972559d9 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
