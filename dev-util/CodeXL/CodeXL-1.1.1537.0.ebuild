# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI="5"
inherit eutils autotools

DESCRIPTION="AMD CodeXL"
HOMEPAGE="http://developer.amd.com/"
SRC_URI="http://developer.amd.com/download/${PN}-Linux-${PV}-x86_64-release.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="X debug optimization"

RDEPEND=""
DEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-Linux-${PV}-x86_64-release"
