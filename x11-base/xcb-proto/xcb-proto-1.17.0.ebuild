# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3+ )
XORG_STATIC=no

inherit python-r1 xorg-2

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="https://xcb.freedesktop.org/"
SRC_URI="https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.17.0.tar.xz -> xcb-proto-1.17.0.tar.xz"

KEYWORDS="*"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	!x11-proto/xcb-proto
"
DEPEND="
	${RDEPEND}
	dev-libs/libxml2
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_configure() {
	python_setup
	xorg-2_src_configure
	python_foreach_impl autotools-utils_src_configure
}

src_compile() {
	default
	python_foreach_impl autotools-utils_src_compile -C xcbgen \
		top_builddir="${BUILD_DIR}"
}

src_install() {
	xorg-2_src_install

	# pkg-config file hardcodes python sitedir, bug 486512
	sed -i -e '/pythondir/s:=.*$:=/dev/null:' \
		"${ED}"/usr/share/pkgconfig/xcb-proto.pc || die

	python_foreach_impl autotools-utils_src_install -C xcbgen \
		top_builddir="${BUILD_DIR}"
}