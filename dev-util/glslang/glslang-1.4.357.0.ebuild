# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Khronos-reference front end for GLSL/ESSL, partial front end for HLSL, and a SPIR-V generator."
HOMEPAGE="https://github.com/KhronosGroup/glslang"
SRC_URI="https://api.github.com/repos/KhronosGroup/glslang/tarball/refs/tags/vulkan-sdk-1.4.357.0 -> glslang-1.4.357.0-168d452.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	dev-util/spirv-tools
	
"
DEPEND="dev-util/spirv-tools
	
"

post_src_unpack() {
	mv KhronosGroup-glslang-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DALLOW_EXTERNAL_SPIRV_TOOLS=1
	)
	cmake-utils_src_configure
}
# Override the src_install to add additonal libraries
src_install() {
	default
	cmake-utils_src_install
	mv ${WORKDIR}/*glslang-*_build/OGLCompilersDLL/libOGLCompiler.a ${ED}/usr/lib64
	mv ${WORKDIR}/*glslang-*_build/glslang/OSDependent/Unix/libOSDependent.a ${ED}/usr/lib64
}



# vim: filetype=ebuild
