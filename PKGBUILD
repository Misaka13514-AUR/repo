# Maintainer:    mzwing <mzwing@mzwing.eu.org>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

_pkgname=cortex
pkgname=cortex.cpp-bin
pkgver=1.0.12
pkgrel=1
pkgdesc='Local AI API Platform'
arch=('x86_64' 'aarch64')
makedepends=('tar')
depends=('openmpi')
url='https://github.com/menloresearch/cortex.cpp'
license=('Apache-2.0')
provides=('cortex' 'cortex-server')
conflicts=('cortex.cpp' 'cortex.cpp-beta' 'cortex.cpp-nightly' 'cortex.cpp-git' 'cortex.cpp-beta-bin' 'cortex.cpp-nightly-bin')
source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-linux-amd64-network-installer.deb")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.deb::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-linux-arm64-network-installer.deb")
sha256sums_x86_64=('4072d672ab6afb7c7a29df5b96cc4e3015135368b00bac6e3d39857702a70421')
sha256sums_aarch64=('f4499a75f8eb510b7d1e7212bbd62b3704202dc7a9c976241a81b7ba1af1d608')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    install -Dm644 "$srcdir"/usr/bin/cortex "$pkgdir"/usr/bin/cortex
    install -Dm644 "$srcdir"/usr/bin/cortex-server "$pkgdir"/usr/bin/cortex-server
}
