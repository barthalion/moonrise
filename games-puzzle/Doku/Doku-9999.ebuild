# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2

EGIT_REPO_URI="git://github.com/cyrusmetcalf/Doku.git"

DESCRIPTION="another ncurses sudoku game"
HOMEPAGE="https://github.com/cyrusmetcalf/Doku"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/makefile.patch
}

src_install() {
	mkdir -p ${D}/usr/bin/
	emake install DESTDIR="${D}"
}
