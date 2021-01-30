#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):67108864:a4c5518afd125b16205fb35faeb6c6f486e46aaa; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):33554432:ea20ee67927de2cf4ef691099d4b0a7f0b706239 \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):67108864:a4c5518afd125b16205fb35faeb6c6f486e46aaa && \
      log -t recovery "Installing new recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
