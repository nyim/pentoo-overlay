# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="5"

#python3 support is comining after bug #484954 fix
PYTHON_COMPAT=( python{2_7,3_4} )
#PYTHON_COMPAT=( python2_7 )
inherit multilib python-r1

HOMEPAGE="https://github.com/darkoperator/dnsrecon"
DESCRIPTION="DNS Enumeration Script"
SRC_URI="https://github.com/darkoperator/dnsrecon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/netaddr"
DEPEND="${RDEPEND}"

src_install() {
	# should be as simple as copying everything into the target...
	dodir /usr/$(get_libdir)/${PN}
	cp -R "${S}"/* "${D}"/usr/$(get_libdir)/${PN} || die "Copy files failed"
	dosym  /usr/$(get_libdir)/${PN}/${PN}.py /usr/bin/${PN}
}
