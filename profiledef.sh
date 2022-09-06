#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="arch-kiosk"
iso_label="ARCH_KIOSK$(date +%Y%m)"
iso_publisher="ghettoDdOS <https://github.com/ghettoDdOS/>"
iso_application="ArchKiosk"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlz4hc,12' -E ztailpacking)
file_permissions=(
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"
  ["/etc/skel/.config/i3/bin/autostart.sh"]="0:0:755"
  ["/usr/local/bin/xinput_calibrator"]="0:0:755"
)
