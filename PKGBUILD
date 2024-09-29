# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.4
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
b2sums_i686=('bb3438fb60d5904890e7b6360ce96e006630fc5f1689d610b69a5f1b067a52357e68b79b0ff0e51a7be7b6db98d8037b2fb4ed7c3118ea9f8c32d23c46770a69')
b2sums_x86_64=('75dd82aafd0c8e59df3c03c51c8f226eeec8096ce763eae0e689f4bdc4c7727f596157c279629da1edbff68af0155ca06c2b0ba6094470d27eb2b69e2ee605bb')
b2sums_armv7h=('679fc4e29dc93e57308f64cc4abdf35d4bde2609834aee4f6598a8ce70307f49822acaa05c0a3fde8037770b5d26490a871be295b468597dae6c518798113a92')
b2sums_aarch64=('e4a23ebc9b71dc52a08492cfae39ff38fd1182545c3ea48b76344b5c60267eafbaa72a2ab76d3f30bafb293de347765fd6883d34c32625f7782ec8a2552e88bc')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
