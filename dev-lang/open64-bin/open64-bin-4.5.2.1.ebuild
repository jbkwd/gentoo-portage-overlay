# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/open64/Attic/open64-4.2.1.ebuild,v 1.2 2012/02/26 16:11:31 xarthisius dead $

EAPI="3"

inherit eutils autotools flag-o-matic

SLOT="4.5"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"

RESTRICT="fetch"

IUSE=""
DESCRIPTION="The open64 compiler suite, based on Pathscale's EKO compiler"
HOMEPAGE="http://open64.net"

DEPEND=""
RDEPEND="!dev-lang/open64"

SRC_URI="x86_open64-4.5.2.1-1.x86_64.tar.bz2"
S="$WORKDIR/x86_open64-4.5.2.1"

src_install() {
  mv ${S} ${D}/usr || die
}
