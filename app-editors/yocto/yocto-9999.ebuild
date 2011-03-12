# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git

EGIT_REPO_URI="git://github.com/akrennmair/yocto.git"

DESCRIPTION="Minimalistic ncurses-based text editor. It is smaller than pico and nano"
HOMEPAGE="https://github.com/akrennmair/yocto"
SRC_URI=""

LICENSE="BEER-WARE"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_install() {
	emake install DESTDIR="${D}"
}
