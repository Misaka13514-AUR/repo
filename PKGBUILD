# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.1
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
b2sums_i686=('57c67e731c9f53fd1ee27547e9b2e9bd0f0bf04c72f3e2ae32c87d72a98e21ccf908bd57d0e2e0d920fdb880e66b79b00e9202db8e7d68e6b8f32cbd7376b6b4')
b2sums_x86_64=('531e55a7fc067c138f9f819bcd8e289977e3d0b0e3fb40dd214920b7a462e8824af38619e04f49932fef4c451c8a796bf14852da4aa8f36b1cd38a81b697ecf2')
b2sums_armv7h=('3e6982bdb8f07e744aff3d7ead126922839259b3063b6392a4b8e6498d16775c1b5bb82c1560f484d581d5a362735d2016faaeccc28453480f6db580719375bd')
b2sums_aarch64=('1853e4ced5162f1d09fbb34797c18c9bab44cbd0fdc91e1fcc3954c19d3b802fe598b77f9979532cf343f9906d786df7006ce1b3ffc2fd9b9b12adae11f17166')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
