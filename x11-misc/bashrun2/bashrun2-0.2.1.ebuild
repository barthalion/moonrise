# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="An application launcher running a modified bash session in a small
terminal window"
HOMEPAGE="https://code.google.com/p/bashrun2/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
		x11-libs/libX11"

src_install() {
	emake DESTDIR="${D}" install
}
