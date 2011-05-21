# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="An application launcher based on bash"
HOMEPAGE="http://bashrun.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE="xdotool"

DEPEND=""
RDEPEND="app-shells/bash
		 xdotool? ( x11-misc/xdotool )"

src_install() {
	dobin ${PN}

	insinto /usr/share
	doins bashrc

	doman bashrun.1
	dodoc CHANGELOG
}
