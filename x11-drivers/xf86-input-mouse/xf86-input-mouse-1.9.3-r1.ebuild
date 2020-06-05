# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools linux-info flag-o-matic 

DESCRIPTION="Driver for xorg-server"
KEYWORDS="*"
IUSE=" "
SRC_URI="https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/archive/xf86-input-mouse-1.9.3/xf86-input-mouse-xf86-input-mouse-1.9.3.tar.bz2 -> xf86-input-mouse-1.9.3-gitlab.tar.bz2"
SLOT="0"
S="$WORKDIR/${PN}-${P}"

DEPEND="
	x11-base/xorg-proto
	>=sys-devel/libtool-2.2.6a
	sys-devel/m4
	>=x11-misc/util-macros-1.18
	
"

RDEPEND="
	${DEPEND}
	
"

WANT_AUTOCONF="latest"
WANT_AUTOMAKE="latest"
AUTOTOOLS_AUTORECONF="1"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		
	)
	append-ldflags -Wl,-z,lazy
	eautoreconf || die
	econf ${XORG_CONFIGURE_OPTIONS[@]} || die
}

src_install() {
	default
	find "${D}" -type f -name '*.la' -delete || die
}