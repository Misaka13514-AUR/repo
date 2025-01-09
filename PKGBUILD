# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.8
pkgrel=2
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
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('c7de04d8a0651150323c8592f4d11c24d107681c867ae845486e72754b138f5da5fd2b0a0f2e443b5a632c31c26df2250824bd6a063f217df73caf90da50c690')
b2sums_x86_64=('276ab8236fa49c09df0405b3ae93395b5e513d075520f9965001b68b15f7ab503c02557b12b17417f5857080eb0aab91e67bbb21d0574451dd15f40f072a7de7')
b2sums_armv7h=('259a6e353fe40efaa88546c0c4d621a45b512a31c27a5de2ad2145d90cacbb4972da7ea854a930612e8f74b4e895abfbed80b75c99ee30ac53de2b32cb42725d')
b2sums_aarch64=('2d2c31225af080b3521ece0ad7c9b835604b157ef194ef2c7d10da92a92a0ebabd7ff734ce4e394ebb779089daf0169598ed021ae3cfb1ec675cea8c0d42f3f6')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
