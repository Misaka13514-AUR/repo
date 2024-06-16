# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.2.9
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
b2sums_i686=('d4cf77ac96571819bd1a5cb0b2ef95d1f93e78dd0d5c00c57ff634345542cd2054b952c74fb0ba2339445ba1f41e17b68e6c6f91df2fd0458da7260a3d339134')
b2sums_x86_64=('26e66f3c7d1833818bb776bb0b142bdbd2c4d53bacc0f735db1eb7a01347b0481b70d79a9d433da5106b6719999007c73626c73cbdeb581c45fe76473497a14a')
b2sums_armv7h=('5e57140e97823d6fffdd572d5a3f4966d923dcd53d6db0c99dc1318926b667549433318e9001a938e986a41edded07aa965ac2543d01321b002c1a417d1b0095')
b2sums_aarch64=('11457d6919e95aac909f6f53ba56524ea2b7a45d0b7a3641f4e42baec9d43b038df4ceb9cceb9d61b0e33954289552cb4bb6b62d1ad7086503c6e7918e5e664c')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
