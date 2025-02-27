# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.7.0
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/subfinder/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')
b2sums_i686=('c5a51ce2e72b4f85cb2993cf2cb9832fb549bc7bba44e1b4d8148df2792f50553b51fe4ee779ab99443983cba76a701f7d53fea43d17d09a9d5880e5ee4bedd5')
b2sums_x86_64=('8eb893b3349f69a3d5866892b7422420d574f71a55636f269eef30cdd0582d02f5b327f49cc926623f64aa1efdb1262073b06868e572d7559a641ea864462672')
b2sums_armv7h=('92d4aec21bd8d7fa792bacef2230a02c1fb3a8d7ed169c1d167ce2b164499484a73888daa9824bc39677dd52674f96501325be2bc066590bfccd09d625be009a')
b2sums_aarch64=('d0cf6c0a66003619098655180125e7edb074dcfafce3afc00236e719ddd533713df754085a0b0cc4bdb5be0985cad82d516c8e9dc2e99188e4b76cd586e4fa58')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
