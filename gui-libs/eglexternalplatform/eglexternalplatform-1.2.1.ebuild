# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="The EGL External Platform interface"
HOMEPAGE="https://github.com/NVIDIA/eglexternalplatform"
SRC_URI="https://api.github.com/repos/NVIDIA/eglexternalplatform/tarball/refs/tags/1.2.1 -> eglexternalplatform-1.2.1-cf9f105.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv NVIDIA-eglexternalplatform-* ${S}
}



# vim: filetype=ebuild
