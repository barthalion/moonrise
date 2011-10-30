# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mozextension

MY_PN="${PN/-bin}"
MY_PV="${PV/_alpha/a}"
MY_P="${MY_PN}-${MY_PV}"
M_DATE="2011-10-29-03-10-36"
REL_URI="http://ftp.mozilla.org/pub/mozilla.org/${MY_PN}/nightly/${M_DATE}-mozilla-central"

DESCRIPTION="Firefox Web Browser"
SRC_URI="x86? ( ${REL_URI}/${MY_PN}-${MY_PV}.en-US.linux-i686.tar.bz2 -> ${MY_P}.tar.bz2 )
amd64? ( ${REL_URI}/${MY_PN}-${MY_PV}.en-US.linux-x86_64.tar.bz2 -> ${MY_P}_64.tar.bz2 )"
HOMEPAGE="http://www.mozilla.com/firefox"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
IUSE="${IUSE}"

DEPEND="app-arch/unzip"
RDEPEND="dev-libs/dbus-glib
x11-libs/libXrender
x11-libs/libXt
x11-libs/libXmu
>=x11-libs/gtk+-2.2:2
>=media-libs/alsa-lib-1.0.16
!www-client/firefox"

S="${WORKDIR}/${MY_PN}"

src_unpack() {
	use x86 && unpack ${MY_P}.tar.bz2
	use amd64 && unpack ${MY_P}_64.tar.bz2
}

src_install() {
	declare MOZILLA_FIVE_HOME=/opt/${MY_PN}

	dodir /opt/
	dodir /opt/bin
	mv "${S}" "${D}"/opt/

	dosym ${D}/opt/firefox/firefox /opt/bin/firefox
}
