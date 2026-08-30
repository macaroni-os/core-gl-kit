# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Vulkan Loader"
HOMEPAGE="https://vulkan.lunarg.com/doc/sdk/latest/linux/LoaderInterfaceArchitecture.html"
SRC_URI="https://api.github.com/repos/KhronosGroup/Vulkan-Loader/tarball/refs/tags/vulkan-sdk-1.4.357.0 -> vulkan-loader-1.4.357.0-5f157b6.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
IUSE="layers wayland X"
BDEPEND="dev-util/cmake
	
"
DEPEND="
	${PYTHON_DEPS}
	>=dev-util/vulkan-headers-1.4.357
	wayland? ( dev-libs/wayland:= )
	X? (
	  x11-libs/libX11:=
	  x11-libs/libXrandr:=
	)
	
"
PDEPEND="
	layers? (
	  >=media-libs/vulkan-layers-1.4.357
	)
	
"

post_src_unpack() {
	mv KhronosGroup-Vulkan-Loader-* ${S}
}


post_src_prepare() {
	# on 64-bit systems, have pkgconfig file reference 'libvulkan' not 'libvulkan64'.
	sed -i -e s'/^Libs:.*$/Libs: -L${libdir} -lvulkan/' loader/vulkan.pc.in || die
}
src_configure() {
	local mycmakeargs=(
	  -DCMAKE_SKIP_RPATH=ON
	  -DBUILD_TESTS=OFF
	  -DBUILD_LOADER=ON
	  -DBUILD_WSI_WAYLAND_SUPPORT=$(usex wayland)
	  -DBUILD_WSI_XCB_SUPPORT=$(usex X)
	  -DBUILD_WSI_XLIB_SUPPORT=$(usex X)
	  -DVULKAN_HEADERS_INSTALL_DIR="${ESYSROOT}/usr"
	)
	cmake-utils_src_configure
}
src_install() {
	keepdir /etc/vulkan/icd.d
	cmake-utils_src_install
}



# vim: filetype=ebuild
