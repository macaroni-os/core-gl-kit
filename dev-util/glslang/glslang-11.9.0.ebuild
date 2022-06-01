# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ https://github.com/KhronosGroup/glslang"
SRC_URI="https://github.com/KhronosGroup/glslang/tarball/9bb8cfffb0eed010e07132282c41d73064a7a609 -> glslang-11.9.0-9bb8cff.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

RDEPEND="!<media-libs/shaderc-2020.1"
BDEPEND="${PYTHON_DEPS}"

# Bug 698850
RESTRICT="test"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-glslang-* "${S}" || die
}