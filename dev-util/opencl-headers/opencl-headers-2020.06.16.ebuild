# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Unified C language headers for the OpenCL API"
HOMEPAGE="https://github.com/KhronosGroup/OpenCL-Headers"
SRC_URI="https://api.github.com/repos/KhronosGroup/OpenCL-Headers/tarball/v2020.06.16 -> opencl-headers-2020.06.16.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

# To avoid file collisions in /usr/include/CL/
DEPEND="!app-eselect/eselect-opencl"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-OpenCL-Headers-* "${S}" || die
}

src_install() {
	insinto /usr/include
	doins -r "${S}"/CL
}