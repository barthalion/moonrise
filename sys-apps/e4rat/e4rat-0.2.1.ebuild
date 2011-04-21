# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="A toolset to accelerate the boot process as well as application startups"
HOMEPAGE="http://e4rat.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/cmake
	${RDEPEND}"
RDEPEND="dev-lang/perl
        >=dev-libs/boost-1.41
	sys-process/audit
	sys-fs/e2fsprogs"

pkg_setup() {
	unset LDFLAGS
}

src_compile() {
	cmake . -DCMAKE_BUILD_TYPE=release || die 'cmake failed'
	emake || die 'emake failed'
}
src_install() {
	emake DESTDIR="${D}" install || die 'emake install failed'
	dodir /var/lib/${PN} || die 'dodir failed'
}

pkg_postinst() {
	ewarn "You must use Linux-2.6.31 or newer version."
	einfo "You should visit http://e4rat.sourceforge.net/wiki/index.php/Main_Page#Getting_it_to_work"
}
