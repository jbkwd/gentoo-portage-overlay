# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils git-r3 qmake-utils
SLOT=0

EGIT_REPO_URI="https://github.com/jbkwd/QuickFit3.git"

DESCRIPTION="A data evaluation package for (imaging) fluorescence correlation spectroscopy and other biophysical methods"
HOMEPAGE="http://www.dkfz.de/Macromol/quickfit/"
LICENSE="LGPL 2.1 GPL 3.0"
DEPEND="dev-qt/qtgui:5
dev-qt/qtsvg:5 
dev-qt/qtxml:5 
dev-qt/qtnetwork:5 
dev-qt/qtopengl:5 
dev-qt/qtwidgets:5 
dev-qt/qtprintsupport:5
dev-qt/qtconcurrent:5
dev-cpp/eigen:3
sci-libs/lmfit
media-libs/cimg
x11-libs/cairo
dev-libs/libusb
sci-libs/gsl
sys-libs/zlib
media-libs/libpng
media-libs/tiff
virtual/jpeg
sci-libs/blas-reference
sci-libs/lapack-reference
>=sci-libs/nlopt-2.4.2"

RDEPEND="${DEPEND}"

src_compile() {
	cd "${WORKDIR}/${PN}"
	eqmake5 quickfit3.pro || die "eqmake failed"
	emake || einfo "Invoking make for the first time failed, second iteration..."
	emake || die "emake failed"
}

src_install() {
    emake DESTDIR="${D}/opt/QuickFit3" install
}
