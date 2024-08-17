# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.1
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
b2sums_i686=('8249c8fa3112e9787b45f6adb2099d1df5ac12aae4569eac9de9f11ad7d6e6330c8d7f0193900706e4d3bb1f4d50eae228386dc9258c395f5ce8a0a5fa6ddd9c')
b2sums_x86_64=('ae180a94709c44fa5920781da9ad79d58b519ec3b291260306849e7921b5e888f1ab578726534a4b90f64a582d04b8dc8507e499497effd6953d9c1d1ebb319c')
b2sums_armv7h=('a5e491e4b679cb59922d361f7791d03b345883af91a3d787bcbabdae6adc930d2e3ed95dde52f8f6dfbb0f2665dc3ca6c7bd3664c095b0260113bfe99071f8ae')
b2sums_aarch64=('ae16167b3e67ee248644b37807f02065454fc267eb7448cf7f5ec2e3765542b3851be4178de4942606b3a8342f224b78e183445b040d73d282c49eb9efc5dff8')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
