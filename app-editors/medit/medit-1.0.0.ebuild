# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=0

DESCRIPTION="A programming and around-programming GTK+ text editor"
HOMEPAGE="http://mooedit.sourceforge.net/"
SRC_URI="mirror://sourceforge/mooedit/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-python/pygtk
        dev-libs/libxml2
        dev-libs/libpcre
        x11-libs/libSM
        >=dev-lang/python-2.2
        >=x11-libs/gtk+-2"
RDEPEND="${DEPEND}"

src_configure() {
  econf
}

src_install() {
  emake DESTDIR="${D}" install || die
}
