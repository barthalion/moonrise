# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-action/teeworlds/teeworlds-0.5.2.ebuild,v 1.2 2010/04/04 13:51:12 hwoarang Exp $

EAPI=3

PYTHON_DEPEND="2"

inherit eutils python games

DESCRIPTION="Online multi-player platform 2D shooter"
HOMEPAGE="http://www.teeworlds.com/"
SRC_URI="http://www.teeworlds.com/files/${P}-src.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug dedicated"

RDEPEND="
	!dedicated? (
		media-libs/pnglite
		media-libs/libsdl[X,audio,opengl,video]
		media-sound/wavpack
		virtual/opengl
		x11-libs/libX11
	)
	sys-libs/zlib"
DEPEND="${RDEPEND}
	~dev-util/bam-0.4.0"

S=${WORKDIR}/${P}-source

pkg_setup() {
	python_set_active_version 2
	games_pkg_setup
}

src_prepare() {
	# 001 & 002 from pull request: https://github.com/oy/teeworlds/pull/493
	epatch \
		"${FILESDIR}"/${P}-001-use-system-wavpack.patch \
		"${FILESDIR}"/${P}-002-fixed-wavpack-sound-loading.patch \
		"${FILESDIR}"/${P}-003-use-system-pnglite.patch
}

src_configure() {
	bam config || die "bam config failed"
}

src_compile() {
	local myopt

	if use debug; then
		myopt=" server_debug"
	else
		myopt=" server_release"
	fi
	if ! use dedicated; then
		if use debug; then
			myopt+=" client_debug"
		else
			myopt+=" client_release"
		fi
	fi

	bam ${myopt} || die "bam failed"
}

src_install() {
	if use debug; then
		newgamesbin ${PN}_srv_d ${PN}_srv || die "newgamesbin failed"
	else
		dogamesbin ${PN}_srv || die "dogamesbin failed"
	fi
	if ! use dedicated; then
		if use debug; then
			newgamesbin ${PN}_d ${PN} || die "newgamesbin failed"
		else
			dogamesbin ${PN} || die "dogamesbin failed"
		fi

		doicon "${FILESDIR}"/${PN}.xpm || die "doicon failed"
		make_desktop_entry ${PN} Teeworlds

		insinto "${GAMES_DATADIR}"/${PN}/data
		doins -r data/* || die "doins failed"
	else
		insinto "${GAMES_DATADIR}"/${PN}/data/maps
		doins -r data/maps/* || die "doins failed"
	fi

	dodoc readme.txt || die "dodoc failed"

	prepgamesdirs
}
