# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XORG_MULTILIB=no
inherit xorg-3

# Note: please bump this with x11-libs/libX11
DESCRIPTION="X.Org Compose Key tables from libX11"
# xorg-3.eclass would attempt to fetch a tarball with a matching name to this package
SRC_URI="${XORG_BASE_INDIVIDUAL_URI}/lib/libX11-${PV}.tar.${XORG_TARBALL_SUFFIX}"
S="${WORKDIR}/libX11-${PV}/"

KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~s390 ~sparc x86 ~x64-macos"

# RDEPEND=""

src_prepare() {
	default
	eapply "${FILESDIR}"/compose-tables-1.8.12-compose-only.patch
	touch keysymdef.h || die
}

src_configure() {
	local XORG_CONFIGURE_OPTIONS=(
		--without-xmlto
		--without-fop
		--disable-specs
		--disable-xkb
		--with-keysymdefdir="${S}"
	)
	xorg-3_src_configure
}

src_compile() {
	emake -C nls
}

src_test() {
	:;
}

src_install() {
	emake DESTDIR="${D}" -C nls install
}
