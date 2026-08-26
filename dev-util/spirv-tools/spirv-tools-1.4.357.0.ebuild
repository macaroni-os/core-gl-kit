# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Tools"
SRC_URI="https://api.github.com/repos/KhronosGroup/SPIRV-Tools/tarball/refs/tags/vulkan-sdk-1.4.357.0 -> spirv-tools-1.4.357.0-9a49b08.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	>=dev-util/spirv-headers-1.4.357.0
	
"
DEPEND="dev-util/spirv-headers
	
"

post_src_unpack() {
	mv KhronosGroup-SPIRV-Tools-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  "-DSPIRV-Headers_SOURCE_DIR=/usr/"
	  "-DSPIRV_WERROR=OFF"
	  "-DSPIRV_TOOLS_BUILD_STATIC=OFF"
	  "-DBUILD_SHARED_LIBS=ON"
	)
	cmake-utils_src_configure
}



# vim: filetype=ebuild
