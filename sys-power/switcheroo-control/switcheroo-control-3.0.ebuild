# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit python-single-r1 systemd

DESCRIPTION="D-Bus service to check the availability of dual-GPU"
HOMEPAGE="https://gitlab.freedesktop.org/hadess/switcheroo-control/"
SRC_URI="https://gitlab.freedesktop.org/hadess/switcheroo-control/-/archive/3.0/switcheroo-control-3.0.tar.bz2 -> switcheroo-control-3.0.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="gtk-doc systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
BDEPEND="$(python_gen_cond_dep 'dev-python/pygobject:3[${PYTHON_USEDEP}]')
	dev-util/gdbus-codegen
	gtk-doc? ( dev-util/gtk-doc )
	
"
RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/pygobject:3[${PYTHON_USEDEP}]')
	>=dev-libs/glib-2.56.0:2
	>=dev-libs/libgudev-232:=
	
"
DEPEND="${RDEPEND}
"
python_check_deps() {
	python_has_version "dev-python/pygobject:3[${PYTHON_USEDEP}]"
}
src_configure() {
	local emesonargs=(
	  -Dsystemdsystemunitdir="$(systemd_get_systemunitdir)"
	  $(meson_use gtk-doc gtk_doc)
	  -Dtests=false
	)
	meson_src_configure
}
src_install() {
	meson_src_install
	python_fix_shebang "${ED}"/usr/bin/switcherooctl
	if ! systemd ; then
	  newinitd "${FILESDIR}"/${PN}-init.d ${PN}
	fi
}
pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
	  elog "You need to enable the service:"
	  if systemd_is_booted; then
	    elog "# systemctl enable ${PN}"
	  else
	    elog "# rc-update add ${PN} default"
	  fi
	fi
}


# vim: filetype=ebuild
