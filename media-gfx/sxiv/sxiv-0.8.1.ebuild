# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils toolchain-funcs

DESCRIPTION="Simple (or small or suckless) X Image Viewer"
HOMEPAGE="https://github.com/muennich/sxiv/"
SRC_URI="https://github.com/downloads/muennich/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/imlib2[X]
		x11-libs/libX11"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-destdir.patch
	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die
	dodoc README.md || die
}
