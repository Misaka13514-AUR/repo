# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.3
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('f35a167c00b9a6e6eb5cdd04afe410e045c7148115a9eddd5bd4f425a2dab087014ca97b8975ca4af3eb23705410b465d83c4f791e998470a444b87bc6cab9f1')
b2sums_i686=('461b86713fddaabff8043a6813abfb93092ca23c81d76f67f719455acaa5ff2cf1173ec2115c33773da809055a5c8a2d2d4e71a2a575df32cddcdb6fabb29805')
b2sums_x86_64=('68ba495b4aef5b5c1718c907a2aa16a0d5ec90293e80cc2d5b40a7e5c326e3005aacdd79284dae95028fe8f16d896797436a3a6e33d32d411f8bfe8e38b1e9a8')
b2sums_armv7h=('7db9964ed4563cb4b6cf7bd48a9552dfc1b4bfaf910149461be1664db1a34542569ce987ff8465a9b85a42e482684725d70cf47d1eccdc4d513a3d7b554ceeaf')
b2sums_aarch64=('4b8704f2e2f25c91f1a8a2e9c0ace4ed818929789698942fce9561d15548101f0c8eb71955e069a91c94322ea0c6e09526d25854412b3b29f753707020910dc8')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
