# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/2e1bc6dcd4ff49ed996dc0174d1aec37c2e9ab59.tar.gz -> spirv-headers-1.5.4_p20210526.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/SPIRV-Headers-* "${S}" || die
}