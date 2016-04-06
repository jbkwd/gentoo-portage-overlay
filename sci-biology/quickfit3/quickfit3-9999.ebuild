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
>=dev-cpp/eigen-3.2.5
sci-libs/lmfit
sci-libs/levmar
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

src_prepare() {
#	cd "${WORKDIR}/${PN}"
	sed -i -e "s#^OUTPUTDIR_NAME = .*#OUTPUTDIR_NAME = ${D}/opt/QuickFit3#g" quickfit_config.pri || die "Failed to set OUTPUTDIR_NAME!"
}

src_compile() {
	cd "${WORKDIR}/${PN}"
	eqmake5 quickfit3.pro || die "eqmake failed"
	ewarn "Running make three times now for some issues. The first two are nonfatal."
	nonfatal emake
	nonfatal emake
	emake || die "emake failed"
}

src_install() {
	emake -j1 install
	
	# Create /usr/bin/firefox-bin
	dodir /usr/bin/
	cat <<-EOF >"${ED}"usr/bin/${PN}
	#!/bin/sh
	unset LD_PRELOAD
	export LD_LIBRARY_PATH="/opt/QuickFit3/"
	cd /opt/QuickFit3/
	exec ./quickfit3 "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}
}
