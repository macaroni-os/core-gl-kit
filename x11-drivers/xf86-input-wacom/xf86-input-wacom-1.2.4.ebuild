# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit systemd udev xorg-3

DESCRIPTION="X.Org driver for Wacom devices"
HOMEPAGE="https://github.com/linuxwacom/xf86-input-wacom"
SRC_URI="https://api.github.com/repos/linuxwacom/xf86-input-wacom/tarball/refs/tags/xf86-input-wacom-1.2.4 -> xf86-input-wacom-1.2.4-2cb4d62.tar.gz"
SLOT="0"
KEYWORDS="*"
IUSE="debug systemd"
RDEPEND="dev-libs/libwacom
	virtual/libudev:=
	x11-base/xorg-server
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXinerama
	
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	
"

post_src_unpack() {
	mv linuxwacom-xf86-input-wacom-* ${S}
}


src_prepare() {
	./autogen.sh
	xorg-3_src_prepare
}
pkg_setup() {
	XORG_CONFIGURE_OPTIONS=(
	  --with-systemd-unit-dir="$(systemd_get_systemunitdir)"
	  --with-udev-rules-dir="$(get_udevdir)/rules.d"
	  $(use_enable debug)
	)
}
src_install() {
	xorg-3_src_install
	rm -rf "${ED}"/usr/share/hal
	if ! use systemd ; then
	  rm -rf "${ED}"/lib/systemd
	fi
}



# vim: filetype=ebuild
