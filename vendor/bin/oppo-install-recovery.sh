#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:f1f17cbcbd70bb0fc1961f2f00db4964cb9c715d; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:91b83addc507e883def0e5de365b3d1d50eabe92 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:f1f17cbcbd70bb0fc1961f2f00db4964cb9c715d && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
