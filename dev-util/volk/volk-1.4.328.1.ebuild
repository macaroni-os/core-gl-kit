# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake-utils

DESCRIPTION="Meta loader for Vulkan API"
HOMEPAGE="https://github.com/zeux/volk"
SRC_URI="https://api.github.com/repos/zeux/volk/tarball/refs/tags/vulkan-sdk-1.4.328.1 -> volk-1.4.328.1-f30088b.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
RDEPEND=">=media-libs/vulkan-loader-1.4.328.1
	
"
DEPEND="${RDEPEND}
	>=dev-util/vulkan-headers-1.4.328.1
	
"

post_src_unpack() {
	mv zeux-volk-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DVOLK_INSTALL=on
	)
	cmake-utils_src_configure
}



# vim: filetype=ebuild
