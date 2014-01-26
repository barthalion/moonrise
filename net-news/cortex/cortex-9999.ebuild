# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2

EGIT_REPO_URI="git://github.com/GGLucas/cortex.git"

DESCRIPTION="an ncurses reddit browser and monitor"
HOMEPAGE="http://cortex.glacicle.org/"
SRC_URI=""

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_install() {
	mkdir -p ${D}/usr/bin/

	cp ${S}/cortex ${D}/usr/bin/
}


