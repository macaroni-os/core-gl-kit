# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit font meson

DESCRIPTION="The typefaces for GNOME"
HOMEPAGE="https://gitlab.gnome.org/GNOME/adwaita-fonts"
SRC_URI="https://download.gnome.org/sources/adwaita-fonts/49/adwaita-fonts-49.0.tar.xz -> adwaita-fonts-49.0.tar.xz"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="*"
src_configure() {
	local emesonargs=(
	  -Ddatadir="${EPREFIX}/usr/share"
	)
	meson_src_configure
}


# vim: filetype=ebuild
