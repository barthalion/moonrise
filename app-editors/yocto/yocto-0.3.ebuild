# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git

EGIT_REPO_URI="git://github.com/akrennmair/yocto.git"
EGIT_COMMIT="${P}"

DESCRIPTION="Minimalistic ncurses-based text editor. It is smaller than pico and nano"
HOMEPAGE="https://github.com/akrennmair/yocto"
SRC_URI=""

LICENSE="THE BEER-WARE LICENSE"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

