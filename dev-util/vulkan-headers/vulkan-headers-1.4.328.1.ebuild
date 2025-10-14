# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake-utils

DESCRIPTION="Vulkan header files and API registry"
HOMEPAGE="https://www.vulkan.org/"
SRC_URI="https://api.github.com/repos/KhronosGroup/Vulkan-Headers/tarball/refs/tags/vulkan-sdk-1.4.328.1 -> vulkan-headers-1.4.328.1-19725e4.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-util/cmake
	
"

post_src_unpack() {
	mv KhronosGroup-Vulkan-Headers-* ${S}
}



# vim: filetype=ebuild
