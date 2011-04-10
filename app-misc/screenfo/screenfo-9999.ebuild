# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git

EGIT_REPO_URI="git://github.com/trapd00r/screenfo.git"

DESCRIPTION="screenshot information tool for nerds"
HOMEPAGE="https://github.com/trapd00r/screenfo"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-lang/perl-5.10
 =dev-perl/Term-ExtendedColor-9999"
DEPEND="${RDEPEND}"

src_prepare() {
	cd ${WORKDIR}/${P}
	/usr/bin/perl Makefile.PL
}

src_install() {
	echo ${D}
	emake DESTDIR="${D}" install

	mkdir ${D}/etc/
	cp ${WORKDIR}/${P}/screenfo.conf ${D}/etc/
	mkdir ${D}/usr/share/screenfo/
	cp -R ${WORKDIR}/${P}/ascii ${D}/usr/share/screenfo/
}

