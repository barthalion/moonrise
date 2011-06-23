# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mozextension

LANGS="af ak ar as ast be bg bn-BD bn-IN br bs ca cs cy da de el en-GB en-ZA \
eo es-AR es-CL es-ES es-MX et eu fa fi fr fy-NL ga-IE gd gl gu-IN he hi-IN hr \
hu hy-AM id is it ja-JP-mac ja ka kk km kn ko ku lg lt lv mai mk ml mn mr nb-NO \
nl nn-NO nso oc or pa-IN pl pt-BR pt-PT rm ro ru si sk sl son sq sr sv-SE ta-LK \
ta te th tr uk vi zh-CN zh-TW zu"
NOSHORTLANGS="en-GB es-AR es-CL es-MX pt-BR zh-CN zh-TW"
MY_PN="${PN/-bin}"
MY_PV="${PV/_alpha/a}"
MY_P="${MY_PN}-${MY_PV}"
REL_URI="http://ftp.mozilla.org/pub/mozilla.org/${MY_PN}/nightly/2011-06-22-03-mozilla-central-l10n"

for lang in ${LANGS}
do
	if [ ${lang} != "en-GB" ]
	then
		SRC_URI_LANG="${SRC_URI_LANG}
linguas_${lang%%-*}? ( ${REL_URI}/${MY_PN}-${MY_PV}.${lang}.langpack.xpi -> ${MY_P}.${lang}.xpi )"
		IUSE="${IUSE} linguas_${lang%%-*}"
	fi
done

DESCRIPTION="Firefox Web Browser"
SRC_URI="x86? ( ${REL_URI}/${MY_PN}-${MY_PV}.en-GB.linux-i686.tar.bz2 -> ${MY_P}.tar.bz2 )
amd64? ( ${REL_URI}/${MY_PN}-${MY_PV}.en-GB.linux-x86_64.tar.bz2 -> ${MY_P}_64.tar.bz2 )
${SRC_URI_LANG}"
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

linguas() {
	local LANG SLANG
	for LANG in ${LINGUAS}; do
		if has ${LANG} en en_US; then
			has en ${linguas} || linguas="${linguas:+"${linguas} "}en"
			continue
		elif has ${LANG} ${LANGS//-/_}; then
			has ${LANG//_/-} ${linguas} || linguas="${linguas:+"${linguas} "}${LANG//_/-}"
			continue
			elif [[ " ${LANGS} " == *" ${LANG}-"* ]]; then
			for X in ${LANGS}; do
				if [[ "${X}" == "${LANG}-"* ]] && \
					[[ " ${NOSHORTLANGS} " != *" ${X} "* ]]; then
					has ${X} ${linguas} || linguas="${linguas:+"${linguas} "}${X}"
					continue 2
				fi
			done
		fi
		ewarn "Sorry, but ${PN} does not support the ${LANG} LINGUA"
	done
}

src_unpack() {
	use x86 && unpack ${MY_P}.tar.bz2
	use amd64 && unpack ${MY_P}_64.tar.bz2

	linguas
	for X in ${linguas}; do
		[[ ${X} != "en" ]] && xpi_unpack "${MY_P}.${X}.xpi"
	done
	if [[ ${linguas} != "" && ${linguas} != "en" ]]; then
		einfo "Selected language packs (first will be default): ${linguas}"
	fi
}

src_install() {
	declare MOZILLA_FIVE_HOME=/opt/${MY_PN}

	dodir /opt/
	dodir /opt/bin
	mv "${S}" "${D}"/opt/

	linguas
	for X in ${linguas}; do
		[[ ${X} != "en" ]] && xpi_install "${WORKDIR}"/"${MY_P}.${X}"
	done

	local LANG=${linguas%% *}
	if [[ -n ${LANG} && ${LANG} != "en" ]]; then
		elog "Setting default locale to ${LANG}"
		echo "pref(\"general.useragent.locale\", \"${LANG}\");" > "${D}/firefox"/defaults/pref/${MY_PN}.js || \
			die "sed failed to change locale"
	fi

	dosym ${D}/opt/firefox/firefox /opt/bin/firefox
}
