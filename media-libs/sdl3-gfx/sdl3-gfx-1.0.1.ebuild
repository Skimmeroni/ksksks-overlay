# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake multilib-minimal

MY_P="${P/sdl3-/SDL3_}"
DESCRIPTION="Graphics drawing primitives library for SDL3"
HOMEPAGE="https://github.com/sabdul-khabir/SDL3_gfx"
SRC_URI="https://github.com/sabdul-khabir/SDL3_gfx/archive/refs/tags/v${PV}.tar.gz"
S="${WORKDIR}"/${MY_P}

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="amd64 ppc ~ppc64 x86"

DEPEND=">=media-libs/libsdl3-3.2[${MULTILIB_USEDEP}]"
RDEPEND="${DEPEND}"

multilib_src_configure() {
	cmake_src_configure
}

multilib_src_compile() {
	cmake_src_compile
}

multilib_src_install() {
	cmake_src_install
}
