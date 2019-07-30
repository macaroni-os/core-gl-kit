# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Mesa's GL headers -- separated out to resolve circ. deps."
HOMEPAGE="https://mesa3d.org"
SRC_URI="https://fastpull-us.funtoo.org/distfiles/mesa-gl-headers-${PVR}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	dodir /usr/include
	(cd ${D}/usr/include && tar xvf ${DISTDIR}/mesa-gl-headers-${PV}.tar.xz) || die "extract failed"
}
