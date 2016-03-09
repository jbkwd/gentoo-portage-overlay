# created by Alexander Krause <admin@erazor-zone.de>  
# http://wiki.erazor-zone.de/doku.php?id=wiki:projects:linux:gentoo  

IUSE=""

S="${WORKDIR}/${PN}"
DESCRIPTION="AS31 Assembler for 8051"
SRC_URI="ftp://scponly:scponly@erazor-zone.de/portage/distfiles///${P}.tar.gz"
HOMEPAGE="http://projects.erazor-zone.de/linux/as31/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~sparc -ppc"

DEPEND="virtual/libc"
RDEPEND="virtual/libc"

# parallel make would fail the task...
#MAKEOPTS="-j1"

src_unpack() {
	cd ${WORKDIR}
	tar zxf ${DISTDIR}/${A}
	cd  ${S}-${PV}
	chmod +x configure
	econf || die "Configure failed! Try using <as31-2.3.1!"
}

src_compile() {
	cd ${S}-${PV}

	emake || die "Make failed! Please submit bugs to admin@erazor-zone.de!"
}

src_install() {
	dobin ${S}-${PV}/as31/as31 &&
	doman ${S}-${PV}/as31/as31.1 || die "install failed!!"
}
