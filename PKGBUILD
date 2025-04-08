# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.2
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
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('b15c8c49f6bbe3cf1dead01f010e43d90025b3793f3228cd03aa85b59487db9e2fb0e01d59e5cbe70380e5eeca8c38178c75d1651f25e6fa5ab44fa1c41c9ccf')
b2sums_x86_64=('da5466f84e309c30aadf282f9dc23bcdedd7c845a4ba3dd23ff2feafea5b0c41f8db0de315075285e064495acd749c7a251507acffe19b15d4173b87f0a2d40b')
b2sums_armv7h=('1d83d910af325e4a5fea42510501f03239302a585f693b2701257f9b3d8e31f41773487432839f1daaf3fc2452c299fbc6449485cba628bad1bc1b2182cc7210')
b2sums_aarch64=('00a6cbc0d43bbbf76486e3e88656eaedf15697fd0469e6ebc1002d4dd4b7545d70164a4228a7c15a1a64171095c136ef892ee50b57419febb3ed2c5e10746f9c')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
