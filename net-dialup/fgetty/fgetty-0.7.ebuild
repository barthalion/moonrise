# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A mingetty stripped of the printfs"
HOMEPAGE="http://www.fefe.de/fgetty/"
SRC_URI="http://www.fefe.de/${PN}/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/dietlibc"
RDEPEND=""

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
