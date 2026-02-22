# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="The GBM EGL external platform library"
HOMEPAGE="https://github.com/NVIDIA/egl-gbm"
SRC_URI="https://api.github.com/repos/NVIDIA/egl-gbm/tarball/refs/tags/1.1.3 -> egl-gbm-1.1.3-a73cbce.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
RDEPEND="media-libs/mesa[gbm(+)]
	x11-libs/libdrm
	
"
DEPEND="${RDEPEND}
	gui-libs/eglexternalplatform
	media-libs/libglvnd
	
"

post_src_unpack() {
	mv NVIDIA-egl-gbm-* ${S}
}


src_install() {
	meson_src_install
	insinto /usr/share/egl/egl_external_platform.d
	doins "${FILESDIR}"/15_nvidia_gbm.json
}



# vim: filetype=ebuild
