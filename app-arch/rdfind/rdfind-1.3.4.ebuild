# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Command-line utility for quickly finding duplicates in a given set of files"
HOMEPAGE="https://rdfind.pauldreik.se/"
SRC_URI="https://rdfind.pauldreik.se/${P}.tar.gz"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-libs/nettle"
RDEPEND="${DEPEND}"

#src_install() {
#	emake DESTDIR="${D}" install || die "Failed emake install"
#	dodoc AUTHORS ChangeLog HACKING NEWS README* TODO
#}
