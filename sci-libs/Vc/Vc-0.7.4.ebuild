# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/polkit-qt/polkit-qt-0.99.0.ebuild,v 1.7 2011/07/13 13:40:15 xarthisius Exp $

EAPI="3"

#MY_P="${P/qt/qt-1}"

inherit cmake-utils

DESCRIPTION="Vc is a free software library to ease explicit vectorization of C++ code."
HOMEPAGE="http://code.compeng.uni-frankfurt.de/projects/vc"
SRC_URI="http://code.compeng.uni-frankfurt.de/attachments/download/183/${P}.tar.gz"

LICENSE="LGPL"
KEYWORDS="~amd64"
SLOT="0"
IUSE="examples"

COMMON_DEPEND=""
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PV}-CMakeList.txt.patch"
#	epatch "${FILESDIR}/${PV}-fma.patch"
#	epatch "${FILESDIR}/${PV}-fma4.patch"
#	epatch "${FILESDIR}/${PV}-examples3.patch"
#	epatch "${FILESDIR}/${PV}-scalar.patch"
#	epatch "${FILESDIR}/${PV}-bulldozer.patch"
#	epatch "${FILESDIR}/${PV}-haswell.patch"
#	epatch "${FILESDIR}/${PV}-fma-opt.patch"
#	epatch "${FILESDIR}/${PV}-mask.patch"
#	epatch "${FILESDIR}/${PV}-fma-fix.patch"
#	epatch "${FILESDIR}/${PV}-disable_vector_units.patch"
#	epatch "${FILESDIR}/${PV}-popcnt.patch"
#       epatch "${FILESDIR}/${PV}-piledriver_popcnt.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build examples EXAMPLES)
	)
        cmake-utils_src_configure
}
