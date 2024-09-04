# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.2
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
b2sums_i686=('4f43ec4b3ee90da852d1f55976e2ca9dff63a3e6b46addc3df6cfeeea8540f6c542559a04f96afdce08ae82b289183fece1e5e61114e21bd70c5d38fb7e41822')
b2sums_x86_64=('677cea0aecee0fd5b602aeba9319e7140e5cfa093c342637354d423a314dac4cf5b42ec25e224c4bc82abe6ffd98531df8d789baf71f5113fcc27ec679378012')
b2sums_armv7h=('c0d81c565fa441d15803a27eb83e93167f8b507eb4efb082d381d81e03a4ff839c519155d6b08fcc27c32a6a6a051be7333c67cc3c5ae35ffda5d0c10c97dc8c')
b2sums_aarch64=('93d75e4d564b537718d0de56d06856fbde2cd31f2c2e71c04d817c60f8ca0f60477e9e3da0ef793dc1fdfce91e6145095bc6f53b60ef200d01a8763c5896c78c')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
