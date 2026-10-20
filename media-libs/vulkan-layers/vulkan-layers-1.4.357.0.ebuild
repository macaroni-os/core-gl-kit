# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Vulkan Validation Layers (VVL)"
HOMEPAGE="https://vulkan.lunarg.com/doc/sdk/latest/linux/khronos_validation_layer.html"
SRC_URI="https://api.github.com/repos/KhronosGroup/Vulkan-ValidationLayers/tarball/refs/tags/vulkan-sdk-1.4.357.0 -> vulkan-layers-1.4.357.0-f4874ee.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
IUSE="wayland X"
BDEPEND="dev-util/cmake
	${PYTHON_DEPS}
	
"
DEPEND="dev-util/glslang
	dev-util/spirv-tools
	dev-util/vulkan-headers
	dev-util/vulkan-utility-libraries
	dev-cpp/robin-hood-hashing
	wayland? ( dev-libs/wayland:= )
	X? (
	  x11-libs/libX11:=
	  x11-libs/libXrandr:=
	)
	
"

post_src_unpack() {
	mv KhronosGroup-Vulkan-ValidationLayers-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DCMAKE_SKIP_RPATH=ON
	  -DBUILD_WSI_WAYLAND_SUPPORT=$(usex wayland)
	  -DBUILD_WSI_XCB_SUPPORT=$(usex X)
	  -DBUILD_WSI_XLIB_SUPPORT=$(usex X)
	  -DBUILD_TESTS=OFF
	  -DGLSLANG_INSTALL_DIR="/usr"
	  -DCMAKE_INSTALL_INCLUDEDIR="/usr/include/"
	  -DSPIRV_HEADERS_INSTALL_DIR="/usr"
	)
	cmake-utils_src_configure
}



# vim: filetype=ebuild
