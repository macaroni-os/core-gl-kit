# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="A client-side decorations library for Wayland clients"
HOMEPAGE="https://gitlab.freedesktop.org/libdecor/libdecor"
SRC_URI="https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/0.2.5/libdecor-0.2.5.tar.bz2 -> libdecor-0.2.5.tar.bz2"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="+dbus +gtk examples"
BDEPEND="dev-util/wayland-scanner
	virtual/pkgconfig
	
"
RDEPEND="dev-libs/wayland
	x11-libs/pango
	x11-libs/cairo
	dbus? ( sys-apps/dbus )
	gtk? ( x11-libs/gtk+:3 )
	examples? (
	  media-libs/libglvnd
	  x11-libs/libxkbcommon
	)
	
"
DEPEND="${RDEPEND}
	dev-libs/wayland-protocols
	
"
src_configure() {
	local emesonargs=(
	  # Avoid auto-magic, built-in feature of meson
	  -Dauto_features=disabled
	  $(meson_feature gtk)
	  $(meson_feature dbus)
	  $(meson_use examples demo)
	  -Dinstall_demo=true
	)
	meson_src_configure
}


# vim: filetype=ebuild
