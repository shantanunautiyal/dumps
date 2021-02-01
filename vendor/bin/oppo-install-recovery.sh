#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:97efe81a7597216fe45bd4777d52a897bdba05b6; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:28f9959b60e1b0a241f2bccbfc81077c730b0dc3 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:97efe81a7597216fe45bd4777d52a897bdba05b6 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
