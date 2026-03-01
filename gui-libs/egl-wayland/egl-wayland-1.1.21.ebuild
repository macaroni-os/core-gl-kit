# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="The EGLStream-based Wayland external platform"
HOMEPAGE="https://github.com/NVIDIA/egl-wayland"
SRC_URI="https://api.github.com/repos/NVIDIA/egl-wayland/tarball/refs/tags/1.1.21 -> egl-wayland-1.1.21-f81fcd0.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/egl-wayland-1.1.6-remove-werror.patch"
)
BDEPEND="dev-util/wayland-scanner
	
"
RDEPEND="dev-libs/wayland
	x11-libs/libdrm
	
"
DEPEND="${RDEPEND}
	dev-libs/wayland-protocols
	gui-libs/eglexternalplatform
	media-libs/libglvnd
	
"

post_src_unpack() {
	mv NVIDIA-egl-wayland-* ${S}
}


src_install() {
	meson_src_install
	insinto /usr/share/egl/egl_external_platform.d
	doins "${FILESDIR}"/10_nvidia_wayland.json
}



# vim: filetype=ebuild
