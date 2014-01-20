# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/polkit-qt/polkit-qt-0.99.0.ebuild,v 1.7 2011/07/13 13:40:15 xarthisius Exp $

EAPI="3"

DESCRIPTION="Digilent Adept2 Runtime"
HOMEPAGE="http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,828&Prod=ADEPT2"
SRC_URI="http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.runtime_2.13.1-x86_64.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

COMMON_DEPEND=""
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

MY_P="digilent.adept.runtime_2.13.1-x86_64"
S="${WORKDIR}/${MY_P}"

src_compile() {
	return
}

src_install()
{
	./install.sh "silent=0" \
		"datapath=${DISTDIR}/usr/local/share/digilent/data" \
		"libpath=${DISTDIR}/usr/lib64/" \
		"sbinpath=${DISTDIR}/usr/sbin/"
}
