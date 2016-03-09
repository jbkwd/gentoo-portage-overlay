# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-dialup/misdnuser/misdnuser-1.1.7.2.ebuild,v 1.1 2008/02/12 08:14:18 sbriesen Exp $

inherit eutils toolchain-funcs

DESCRIPTION="mISDN (modular ISDN) kernel link library and includes"
HOMEPAGE="http://www.mISDN.org"
#SRC_URI="http://www.misdn.org/downloads/releases/${MY_P}.tar.gz"
#SRC_URI="http://www.colognechip.com/download/mISDN/socket/mISDNuser.tar.bz2"
SRC_URI="http://isdn.eversberg.eu/download/lcr-1.10/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

EAPI=2

RDEPEND="net-dialup/misdnuser"
DEPEND="${RDEPEND}"

#S="${WORKDIR}/${MY_P}"
S="${WORKDIR}/lcr"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
#	emake -j1 CC="$(tc-getCC)" MISDNDIR="/usr"
	emake -j1 CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc CHANGES doc/*
}
