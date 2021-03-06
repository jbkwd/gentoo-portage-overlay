# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/polkit-qt/polkit-qt-0.99.0.ebuild,v 1.7 2011/07/13 13:40:15 xarthisius Exp $

EAPI="3"

#MY_P="${P/qt/qt-1}"

inherit cmake-utils

DESCRIPTION="Vc is a free software library to ease explicit vectorization of C++ code."
HOMEPAGE="http://code.compeng.uni-frankfurt.de/projects/vc"
SRC_URI="http://code.compeng.uni-frankfurt.de/attachments/download/78/${P}.tar.gz"

LICENSE="LGPL"
KEYWORDS="~amd64"
SLOT="0"
IUSE="examples"

COMMON_DEPEND=""
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

#S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}/${PV}-CMakeList.txt.patch"
}

src_configure() {
#        mycmakeargs=(
#                $(cmake-utils_use_build examples)
#        )
        cmake-utils_src_configure
}

