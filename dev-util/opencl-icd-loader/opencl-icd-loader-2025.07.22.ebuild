# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake prefix

DESCRIPTION="The OpenCL ICD Loader project."
HOMEPAGE="https://github.com/KhronosGroup/OpenCL-ICD-Loader"
SRC_URI="https://api.github.com/repos/KhronosGroup/OpenCL-ICD-Loader/tarball/refs/tags/v2025.07.22 -> opencl-icd-loader-2025.07.22-ad770a1.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
RDEPEND="!dev-libs/ocl-icd
	
"
DEPEND=">=dev-util/opencl-headers-2025.07.22
	
"

post_src_unpack() {
	mv KhronosGroup-OpenCL-ICD-Loader-* ${S}
}


src_prepare() {
	hprefixify loader/icd_platform.h
	cmake_src_prepare
}



# vim: filetype=ebuild
