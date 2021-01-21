#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3e372a33a8761c19a2cd7a20fc963676401b1645; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:aca648944d5f5b593fee519a9736a300953d5c66 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3e372a33a8761c19a2cd7a20fc963676401b1645 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
