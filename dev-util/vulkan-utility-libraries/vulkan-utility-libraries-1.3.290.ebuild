# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=Vulkan-Utility-Libraries
PYTHON_COMPAT=( python3+ )
PYTHON_REQ_USE="xml(+)"
inherit cmake-utils python-any-r1

EGIT_COMMIT="vulkan-sdk-${PV}"
SRC_URI="https://github.com/KhronosGroup/${MY_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="*"
S="${WORKDIR}"/${MY_PN}-${EGIT_COMMIT}

DESCRIPTION="Share code across various Vulkan repositories"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Utility-Libraries"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
RESTRICT=""

DEPEND="~dev-util/vulkan-headers-${PV}"
BDEPEND="${PYTHON_DEPS}"

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=OFF
	)
	cmake_utils_src_configure
}

# vim: filetype=ebuild
