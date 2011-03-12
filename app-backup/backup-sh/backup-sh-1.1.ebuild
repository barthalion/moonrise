# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git

EGIT_REPO_URI="git://github.com/11mariom/backup.sh.git"
EGIT_COMMIT="v${PV}"

DESCRIPTION="A backup script using rdiff-backup."
HOMEPAGE="https://github.com/11mariom/backup.sh"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-backup/rdiff-backup"
DEPEND="${RDEPEND}"

src_install() {
	mkdir -p ${D}usr/bin/
	mkdir ${D}etc/

	chmod +x ${WORKDIR}/${P}/backup.sh

	cp ${WORKDIR}/${P}/backup.sh ${D}/usr/bin/

	cp ${WORKDIR}/${P}/backup.sh.rc.example ${D}/etc/
}

