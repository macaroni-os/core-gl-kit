# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Utility libraries for Vulkan developers"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Utility-Libraries"
SRC_URI="https://api.github.com/repos/KhronosGroup/Vulkan-Utility-Libraries/tarball/refs/tags/vulkan-sdk-1.4.328.1 -> vulkan-utility-libraries-1.4.328.1-4322db5.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	dev-util/cmake
	
"
DEPEND="
	>=dev-util/vulkan-headers-1.4.328
	
"

post_src_unpack() {
	mv KhronosGroup-Vulkan-Utility-Libraries-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DBUILD_TESTS=OFF
	)
	cmake-utils_src_configure
}



# vim: filetype=ebuild
