# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.3.0
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
b2sums_i686=('c4e0f4dbcba89fa886557218878c3a62fdf68cd8fbd5da29e2e36673a04f5312f0f5399e0406f59d9e16b20a92b68f8a81bdae07230821c2cdc920d2a5b3f3d2')
b2sums_x86_64=('d5e92c316c63894549408f1472f0570b75b549f159a8d0a5ae9ac2f47b57bc39c0dd042a42563dd5e246767d74292cd9b2852c25e44f5e8a2f0c54c96e6fbe71')
b2sums_armv7h=('64dfc081c86b28b72a5db5d860f69528b5c6fb058ddff23050431cafc39397335ddbb750e0ad0cea60f1f0ef8d229d0ae747d8c94432f3087292880432a88a17')
b2sums_aarch64=('56235e2790e4820fd0523490114e96a4b66d44e99201738f86794741371e8d3b2d12d66b16cbd7b9278e6cd934945108e01b3a3bb31a77e8a1fdf3a0252dbdd9')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
