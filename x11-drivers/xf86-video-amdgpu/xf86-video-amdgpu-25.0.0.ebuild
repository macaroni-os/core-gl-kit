# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson flag-o-matic

DESCRIPTION="Accelerated Open Source driver for AMDGPU cards"
HOMEPAGE="https://www.x.org/wiki/ https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu"
SRC_URI="https://www.x.org/releases/individual/driver/xf86-video-amdgpu-25.0.0.tar.xz -> xf86-video-amdgpu-25.0.0.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="udev"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="media-libs/mesa
	x11-base/xorg-server
	udev? ( virtual/libudev:= )
	x11-libs/libpciaccess
	x11-libs/libdrm[video_cards_amdgpu]
	
	
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	
"
pkg_setup() {
	filter-flags -fno-plt
	append-ldflags -Wl,-z,lazy
}
src_configure() {
	local emesonargs=(
	  -Ddefault_library=shared
	  -Dglamor=enabled
	   $(meson_feature udev)
	)
	meson_src_configure
}


# vim: filetype=ebuild
