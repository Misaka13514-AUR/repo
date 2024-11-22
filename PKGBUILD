# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.6
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
b2sums_i686=('f8962de3dc79b7d98baa5a84d647255c77680f38f7e2e887b4eaa4eb0cd815f13ba49d9a3057c5c7a70c4a3227073f67b6dea8d9740723b1481af09f47eae50b')
b2sums_x86_64=('2706f0fe4cc6dd2089e24d1e9f2cbbf55b29bc38a2a9b456546ea30d0968c99fc4fa1bf2543fab9bdb6f3e464ec2152841f4d73b919eb1a3f1b868c33712e6e9')
b2sums_armv7h=('ca9d8618349d40de65e633922d9e1ac3b53a39c55e411f79f21428ab27daf1100fbaef1bc1bd49119be4b8110ac8fb61f1738dcb08fd8bfda31f6fcbd6a492e7')
b2sums_aarch64=('5a8f4389bb063496774e23e6a12e40611761602f9e859956bb376f6b796b5d10f4fe931b9dcef6db74fe3876789f8277a31a432fb39411857c256c0ffab71f46')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
