# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://api.github.com/repos/KhronosGroup/SPIRV-Headers/tarball/1.5.4 -> spirv-headers-1.5.4.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/KhronosGroup-SPIRV-Headers-* "${S}" || die
}