# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/lightdm/lightdm-0.1.2.ebuild,v 1.2 2010/11/01 18:36:34 ssuominen Exp $

EAPI=2
inherit autotools eutils pam

DESCRIPTION="A lightweight display manager"
HOMEPAGE="http://launchpad.net/lightdm"
SRC_URI="http://people.ubuntu.com/~robert-ancell/${PN}/releases/${P}.tar.gz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk +introspection nls qt4 webkit"

RDEPEND="dev-libs/glib:2
	dev-libs/dbus-glib
	x11-libs/libxcb
	x11-libs/libXdmcp
	x11-libs/libxklavier
	virtual/pam
	introspection? ( dev-libs/gobject-introspection )
	gtk? ( 	x11-libs/gtk+:2 )
	webkit? ( net-libs/webkit-gtk )
	qt4? ( x11-libs/qt-gui:4
		sys-auth/consolekit )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	nls? ( dev-util/intltool )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-gentoo.patch
	sed -e "/^SUBDIRS/d" -i data/Makefile.am || die
	eautoreconf
}

src_configure() {
	econf \
		--localstatedir=/var \
		--disable-dependency-tracking \
		--disable-static \
		$(use_enable webkit liblightdm-webkit) \
		$(use_enable qt4 liblightdm-qt) \
		$(use_enable gtk liblightdm-gtk) \
		$(use_enable introspection) \
		$(use_enable nls) \
		--with-html-dir=/usr/share/doc/${PF}/html
}

src_install() {
	emake DESTDIR="${D}" install || die
	pamd_mimic system-local-login lightdm auth account session
	dodoc ChangeLog NEWS || die
	find "${D}" -name '*.la' -exec rm -f '{}' +
}
