# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
USE_RUBY="ruby30 ruby31 ruby32"
inherit autotools flag-o-matic ruby-single

DESCRIPTION="OpenCL ICD Loader (free software)"
HOMEPAGE="https://github.com/OCL-dev/ocl-icd"
SRC_URI="https://api.github.com/repos/OCL-dev/ocl-icd/tarball/refs/tags/v2.3.4 -> ocl-icd-2.3.4-e5b32d5.tar.gz"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="*"
BDEPEND="${RUBY_DEPS}
	
"
RDEPEND="!dev-libs/opencl-icd-loader
	
"
DEPEND="dev-util/opencl-headers
	app-text/asciidoc
	
"

post_src_unpack() {
	mv OCL-dev-ocl-icd-* ${S}
}


src_prepare() {
	replace-flags -Os -O2 # bug 646122
	default
	eautoreconf
}
src_configure() {
	# dev-util/opencl-headers ARE official Khronos Group headers, what this option
	# does is disable the use of the bundled ones
	ECONF_SOURCE="${S}" econf --enable-pthread-once --disable-official-khronos-headers
}
src_install() {
	default
	# Drop .la files
	find "${ED}" -name '*.la' -delete || die
}



# vim: filetype=ebuild
