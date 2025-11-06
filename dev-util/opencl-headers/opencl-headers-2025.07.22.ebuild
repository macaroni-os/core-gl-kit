# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Khronos OpenCL-Headers"
HOMEPAGE="https://github.com/KhronosGroup/OpenCL-Headers"
SRC_URI="https://api.github.com/repos/KhronosGroup/OpenCL-Headers/tarball/refs/tags/v2025.07.22 -> opencl-headers-2025.07.22-8a97ebc.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv KhronosGroup-OpenCL-Headers-* ${S}
}



# vim: filetype=ebuild
