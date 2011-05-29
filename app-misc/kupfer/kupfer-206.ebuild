# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit waf-utils eutils

DESCRIPTION="kupfer, a convenient command and access tool"
HOMEPAGE="http://kaizer.se/wiki/kupfer/"

MY_P="${PN}-v${PV}"

SRC_URI="http://kaizer.se/publicfiles/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+keybinder doc +nautilus"

COMMON_DEPEND=">=dev-lang/python-2.6
	dev-python/pygtk
	dev-python/pyxdg
	dev-python/dbus-python
	dev-python/libwnck-python
	dev-python/pygobject
	dev-python/libgnome-python"
	# dev-python/gnome-keyring-python doesn't work well with Kupfer
	# dev-python/gnome-keyring-python
DEPEND="${COMMON_DEPEND}
	dev-python/docutils
	doc? ( app-text/gnome-doc-utils )
	dev-util/intltool"
RDEPEND="${COMMON_DEPEND}
	keybinder? ( dev-libs/keybinder )
	nautilus? ( gnome-base/nautilus )"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}/${P}-xfce4-terminal.patch"
}

src_configure() {
	local myopts=""
	use nautilus || myopts="--no-install-nautilus-extension"
	waf-utils_src_configure --no-update-mime $myopts || \
		die "Error: configure failed!"
}

src_install() {
	waf-utils_src_install || die "Error: install failed!"
	if ! use doc; then
		rm -rf "${ED}"usr/share/gnome/help/kupfer
	fi
}
