# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="NVIDIA container runtime toolkit"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-toolkit"

EGO_SUM=(
	"github.com/!n!v!i!d!i!a/go-nvlib v0.6.0"
	"github.com/!n!v!i!d!i!a/go-nvlib v0.6.0/go.mod"
	"github.com/!n!v!i!d!i!a/go-nvml v0.12.4-0"
	"github.com/!n!v!i!d!i!a/go-nvml v0.12.4-0/go.mod"
	"github.com/blang/semver/v4 v4.0.0"
	"github.com/blang/semver/v4 v4.0.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.4"
	"github.com/cpuguy83/go-md2man/v2 v2.0.4/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/fsnotify/fsnotify v1.7.0"
	"github.com/fsnotify/fsnotify v1.7.0/go.mod"
	"github.com/google/uuid v1.3.0/go.mod"
	"github.com/google/uuid v1.6.0"
	"github.com/google/uuid v1.6.0/go.mod"
	"github.com/hashicorp/errwrap v1.0.0/go.mod"
	"github.com/hashicorp/errwrap v1.1.0"
	"github.com/hashicorp/errwrap v1.1.0/go.mod"
	"github.com/hashicorp/go-multierror v1.1.1"
	"github.com/hashicorp/go-multierror v1.1.1/go.mod"
	"github.com/kr/pretty v0.2.1/go.mod"
	"github.com/kr/pretty v0.3.1"
	"github.com/kr/pretty v0.3.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/mndrix/tap-go v0.0.0-20171203230836-629fa407e90b/go.mod"
	"github.com/mrunalp/fileutils v0.5.0/go.mod"
	"github.com/opencontainers/runtime-spec v1.0.3-0.20220825212826-86290f6a00fb/go.mod"
	"github.com/opencontainers/runtime-spec v1.2.0"
	"github.com/opencontainers/runtime-spec v1.2.0/go.mod"
	"github.com/opencontainers/runtime-tools v0.9.1-0.20221107090550-2e043c6bd626"
	"github.com/opencontainers/runtime-tools v0.9.1-0.20221107090550-2e043c6bd626/go.mod"
	"github.com/opencontainers/selinux v1.9.1/go.mod"
	"github.com/opencontainers/selinux v1.11.0"
	"github.com/opencontainers/selinux v1.11.0/go.mod"
	"github.com/pelletier/go-toml v1.9.5"
	"github.com/pelletier/go-toml v1.9.5/go.mod"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rogpeppe/go-internal v1.9.0"
	"github.com/rogpeppe/go-internal v1.9.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/sirupsen/logrus v1.8.1/go.mod"
	"github.com/sirupsen/logrus v1.9.3"
	"github.com/sirupsen/logrus v1.9.3/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.9.0"
	"github.com/stretchr/testify v1.9.0/go.mod"
	"github.com/syndtr/gocapability v0.0.0-20200815063812-42c35b437635"
	"github.com/syndtr/gocapability v0.0.0-20200815063812-42c35b437635/go.mod"
	"github.com/urfave/cli v1.19.1/go.mod"
	"github.com/urfave/cli/v2 v2.27.2"
	"github.com/urfave/cli/v2 v2.27.2/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb/go.mod"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415/go.mod"
	"github.com/xeipuuv/gojsonschema v1.2.0"
	"github.com/xeipuuv/gojsonschema v1.2.0/go.mod"
	"github.com/xrash/smetrics v0.0.0-20240521201337-686a1a2994c1"
	"github.com/xrash/smetrics v0.0.0-20240521201337-686a1a2994c1/go.mod"
	"golang.org/x/mod v0.19.0"
	"golang.org/x/mod v0.19.0/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20191115151921-52ab43148777/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"golang.org/x/sys v0.22.0"
	"golang.org/x/sys v0.22.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"sigs.k8s.io/yaml v1.3.0"
	"sigs.k8s.io/yaml v1.3.0/go.mod"
	"tags.cncf.io/container-device-interface v0.8.0"
	"tags.cncf.io/container-device-interface v0.8.0/go.mod"
	"tags.cncf.io/container-device-interface/specs-go v0.8.0"
	"tags.cncf.io/container-device-interface/specs-go v0.8.0/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/NVIDIA/nvidia-container-toolkit/tarball/a470818ba7d9166be282cd0039dd2fc9b0a34d73 -> nvidia-container-toolkit-1.16.1-a470818.tar.gz
https://distfiles.macaronios.org/e2/1a/7d/e21a7d1ed8dd8235cd574a9b3ed53875471d1006ce11886afdb4a65ede7e428537fa246d04bb0bfb18f68042d72ef97b091db7a853aa172c79058e425998341e -> nvidia-container-toolkit-1.16.1-funtoo-go-bundle-0d63f7bb11f273d6506985458ced8f2b664be2b538fdc85b0ddeda00e2906859ce02d3033a7b0decc5c77de8b87a75589141d8fe4d2ccace44f67d7f985867df.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}/NVIDIA-nvidia-container-toolkit-a470818"

RDEPEND="app-emulation/libnvidia-container"

DEPEND="${RDEPEND}"

BDEPEND="dev-lang/go"

src_compile() {
	emake binaries || die
}

src_install() {
	dobin "nvidia-container-runtime"
	dobin "nvidia-container-runtime-hook"
	dobin "nvidia-container-runtime.cdi"
	dobin "nvidia-container-runtime.legacy"
	dobin "nvidia-ctk"
	into "/usr/bin"
	insinto "/etc/nvidia-container-runtime"
	doins "${FILESDIR}/config.toml"
}

pkg_postinst() {
	elog "Your docker service must restart after install this package."
	elog "OpenRC: sudo rc-service docker restart"
	elog "You may need to edit your /etc/nvidia-container-runtime/config.toml"
	elog "file before running ${PN} for the first time."
	elog "For details, please see the NVIDIA docker manual page."
}
