# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI="4"

inherit qt4-r2 versionator

MY_P="${PN}-$(replace_version_separator 3 '-')"

DESCRIPTION="qt4-fsarchiver a program with a graphical interface for easy operation the archiving program fsarchiver (Flexible filesystem archiver) for backup and deployment tool"
HOMEPAGE="http://qt4-fsarchiver.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/source/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""+onbydefault" btrfs jfs ntfs reiser4 reiserfs xfs"

DEPEND="app-arch/xz-utils
	app-backup/fsarchiver[lzma,lzo]
	dev-libs/glib:2
	dev-libs/libgcrypt
	dev-libs/lzo
	>=sys-fs/e2fsprogs-1.41.4
	x11-libs/qt-core:4
	x11-libs/qt-gui:4"
	sys-fs/sshfs-fuse
	net-analyzer/nmap
	net-fs/samba
	net-misc/sshpass
RDEPEND="${DEPEND}
	btrfs? ( sys-fs/btrfs-progs )
	jfs? ( sys-fs/jfsutils )
	ntfs? ( sys-fs/ntfs3g[ntfsprogs] )
	reiser4? ( sys-fs/reiser4progs )
	reiserfs? ( sys-fs/reiserfsprogs )
	xfs? ( sys-fs/xfsprogs )"
	
S="${WORKDIR}/${PN}"

src_prepare() {
	# fix .desktop file
	sed -i -e '/Encoding/d' starter/"${PN}".desktop || die "sed on qt4-fsarchiver.desktop failed"

	qt4-r2_src_prepare
}

src_configure() {
	eqmake4 "${PN}".pro OPTION_LZO_SUPPORT=1 OPTION_LZMA_SUPPORT=1
}
