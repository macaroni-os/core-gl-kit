# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Vulkan Development Tools"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Tools"
SRC_URI="https://api.github.com/repos/KhronosGroup/Vulkan-Tools/tarball/refs/tags/vulkan-sdk-1.4.328.1 -> vulkan-tools-1.4.328.1-c08c91e.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="cube wayland +X"
REQUIRED_USE="!cube? ( || ( X wayland ) ) cube? ( ^^ ( X wayland ) )
"
BDEPEND="${PYTHON_DEPS}
	dev-util/cmake
	cube? ( dev-util/glslang:= )
	
"
RDEPEND="
	>=media-libs/vulkan-loader-1.4.328:=[wayland,X?]
	wayland? ( dev-libs/wayland:= )
	X? (
	  x11-libs/libX11:=
	  x11-libs/libXrandr:=
	)
	
"
DEPEND="
	${RDEPEND}
	>=dev-util/vulkan-headers-1.4.328
	>=dev-util/volk-1.4.328
	
"

post_src_unpack() {
	mv KhronosGroup-Vulkan-Tools-* ${S}
}


pkg_setup() {
	python-any-r1_pkg_setup
}
src_configure() {
	local mycmakeargs=(
	  -DCMAKE_SKIP_RPATH=ON
	  -DBUILD_VULKANINFO=ON
	  -DBUILD_CUBE=$(usex cube)
	  -DBUILD_WSI_WAYLAND_SUPPORT=$(usex wayland)
	  -DBUILD_WSI_XCB_SUPPORT=$(usex X)
	  -DBUILD_WSI_XLIB_SUPPORT=$(usex X)
	  -DVULKAN_HEADERS_INSTALL_DIR="${EPREFIX}/usr"
	)
	use cube && mycmakeargs+=(
	  -DGLSLANG_INSTALL_DIR="${EPREFIX}/usr"
	  -DCUBE_WSI_SELECTION=$(usex X XCB WAYLAND)
	)
	cmake-utils_src_configure
}
src_install() {
	cmake-utils_src_install
}



# vim: filetype=ebuild
