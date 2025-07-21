# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Vulkan Validation Layers"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-ValidationLayers"
SRC_URI="https://github.com/KhronosGroup/Vulkan-ValidationLayers/tarball/a92629196a4fed15e59c74aa965dd47bd5ece3b7 -> Vulkan-ValidationLayers-1.3.290.0-a926291.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="wayland X"

BDEPEND=">=dev-util/cmake-3.10.2"
DEPEND="
	=dev-util/glslang-1.3.290.0_p20240625*
	=dev-util/spirv-tools-2024.2_p20240620*
	=dev-util/vulkan-headers-1.3.290*
	dev-util/vulkan-utility-libraries
	${PYTHON_DEPS}
	dev-cpp/robin-hood-hashing
	wayland? ( dev-libs/wayland:= )
	X? (
		x11-libs/libX11:=
		x11-libs/libXrandr:=
	)
"

post_src_unpack() {
	mv "${WORKDIR}"/KhronosGroup-Vulkan-ValidationLayers-* "${S}" || die
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
		-DBUILD_WSI_WAYLAND_SUPPORT=$(usex wayland)
		-DBUILD_WSI_XCB_SUPPORT=$(usex X)
		-DBUILD_WSI_XLIB_SUPPORT=$(usex X)
		-DBUILD_TESTS=OFF
		-DGLSLANG_INSTALL_DIR="${EPREFIX}/usr"
		-DCMAKE_INSTALL_INCLUDEDIR="${EPREFIX}/usr/include/"
		-DSPIRV_HEADERS_INSTALL_DIR="${EPREFIX}/usr"
	)
	cmake-utils_src_configure
}
