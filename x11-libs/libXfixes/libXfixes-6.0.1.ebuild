# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_DOC=doc
XORG_MULTILIB=yes
XORG_TARBALL_SUFFIX="xz"
inherit xorg-3

DESCRIPTION="X.Org Xfixes library"

KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris ~x86-winnt"

RDEPEND="x11-base/xorg-proto
	>=x11-libs/libX11-1.6.2[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"

