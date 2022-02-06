# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="NVIDIA Docker"
HOMEPAGE="https://github.com/NVIDIA/nvidia-docker"
SRC_URI="https://github.com/NVIDIA/nvidia-docker/archive/v2.9.0.tar.gz -> nvidia-docker-2.9.0.tar.gz"

LICENSE="NVIDIA"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
	app-emulation/docker
	app-emulation/nvidia-container-runtime
	x11-drivers/nvidia-drivers"

src_compile() {
	:
}

src_install() {
	dobin ${PN}
	dodir /etc/docker
	insinto /etc/docker
	doins daemon.json
}