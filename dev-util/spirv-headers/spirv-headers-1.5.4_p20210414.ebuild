# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/dafead1765f6c1a5f9f8a76387dcb2abe4e54acd.tar.gz -> spirv-headers-1.5.4_p20210414.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/SPIRV-Headers-* "${S}" || die
}