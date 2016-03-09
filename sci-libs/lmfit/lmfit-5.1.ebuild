EAPI="2"

inherit toolchain-funcs eutils
                                                                                                                                                                                                                        
DESCRIPTION="a C/C++ routine for Levenberg-Marquardt minimization with wrapper for least-squares curve fitting"       
HOMEPAGE="http://joachimwuttke.de/lmfit/"

SRC_URI="http://apps.jcns.fz-juelich.de/src/lmfit/${P}.tgz"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


#src_prepare() {
#    epatch "${FILESDIR}/libmath.patch"
#    epatch "${FILESDIR}/lmcurve.h.patch"
#}


src_install() {
    emake DESTDIR="${D}" install || die "Install failed"
}

