# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit font

DESCRIPTION="Sedgwick Ave Display Font"
SRC_URI="https://font.download/dl/font/sedgwick-ave-display.zip -> sedgwick-ave-display-20250621.zip"
LICENSE="OFL"
SLOT="0"
KEYWORDS="*"
BDEPEND="app-arch/unzip
	
"
S="${WORKDIR}"
src_install() {
	local fontdir=/usr/share/fonts
	insinto ${fontdir}
	doins ${S}/SedgwickAveDisplay-Regular.ttf
}
pkg_postrm() {
	font_pkg_postrm
}
pkg_postinst() {
	font_pkg_postinst
}


# vim: filetype=ebuild
