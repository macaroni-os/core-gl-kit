# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
WANT_AUTOCONF="latest"
WANT_AUTOMAKE="latest"
AUTOTOOLS_AUTORECONF="1"
inherit autotools flag-o-matic

DESCRIPTION="Driver for xorg-server"
SRC_URI="https://www.x.org/releases/individual/driver/xf86-input-libinput-1.5.0.tar.xz -> xf86-input-libinput-1.5.0.tar.xz"
SLOT="0"
KEYWORDS="*"
RDEPEND="x11-base/xorg-server
	x11-misc/util-macros
	dev-libs/libinput
	x11-libs/libXi
	x11-libs/libXtst
	
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	sys-devel/libtool
	sys-devel/m4
	sys-libs/mtdev
	
"
pkg_setup() {
	append-ldflags -Wl,-z,lazy
}
src_prepare() {
	eautoreconf || die
	default
}
src_install() {
	default
	find "${D}" -type f -name '*.la' -delete || die
	# See FL-7952: Make libinput take priority over synaptics.
	(cd ${D}/usr/share/X11/xorg.conf.d/ && mv 40-libinput.conf 80-libinput.conf) || die
}


# vim: filetype=ebuild
