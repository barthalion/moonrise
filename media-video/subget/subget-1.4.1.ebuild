# Copyright 1999-2006 Gentoo Foundation                                                                                                  
# Distributed under the terms of the GNU General Public License v2                                                                       
# $                                                                                                                                      

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
PV="1.4"

inherit git-2 distutils

MY_P="subget-${PV}"

DESCRIPTION="Simple Subtitles downloading program for Linux with PyGTK. Supports plugins and multi-language." 
HOMEPAGE="https://github.com/webnull/subget"
SRC_URI=""

EGIT_REPO_URI="git://github.com/webnull/subget.git"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="dbus"

DEPEND="dev-lang/python
        ( app-arch/p7zip )
        ( dev-python/pygtk )
        dbus? ( dev-python/dbus-python )
        ( sys-devel/gettext )"
RDEPEND="${DEPEND}" 

src_install() { 
  if !use dbus; then
    rm src/subgetlib/bus.py
  fi

  distutils_src_install

  mv subget.py subget
  exeinto /usr/bin
  doexe subget

  insinto /usr/share/applications
  doins usr/share/applications/subget.desktop

  insinto /usr/share/menu
  doins usr/share/menu/subget

  insinto /usr/share/
  doins -r usr/share/subget
}
