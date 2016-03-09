# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils
DESCRIPTION="Levenberg-Marquardt nonlinear least squares algorithms ANSI C implementation"
HOMEPAGE="http://www.ics.forth.gr/~lourakis/levmar/"
SRC_URI="http://www.ics.forth.gr/~lourakis/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/f2c-20060507
		>=virtual/blas-1.0
		>=virtual/lapack-3.1"
RDEPEND="${DEPEND}"

MIN_CMAKE="dev-util/cmake-1.4"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-f2c_main.patch "${FILESDIR}"/${PV}-make-shared.patch "${FILESDIR}"/${PV}-cmake-shared.patch
}

src_compile() {
	if has_version ">=${MIN_CMAKE}"
	then
		cmake . || die "cmake failed"
	fi
	emake || die "make failed"
}

src_install() {
	local my_include_dir=/usr/include/${PN}	
	insinto ${my_include_dir}
	doins *.h

	dolib liblevmar.so
}
