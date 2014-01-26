# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2

EGIT_REPO_URI="git://github.com/trapd00r/Term-ExtendedColor.git"

DESCRIPTION="perl module"
HOMEPAGE="https://github.com/trapd00r/Term-ExtendedColor"
SRC_URI=""

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-lang/perl-5.10"
DEPEND="${RDEPEND}"

src_prepare() {
	cd ${WORKDIR}/${P}
	/usr/bin/perl Makefile.PL
}

src_install() {
	emake
	emake test
	emake DESTDIR="${D}" install
}