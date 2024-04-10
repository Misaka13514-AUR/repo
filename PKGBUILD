# Maintainer: João Victor Soares <joao.victor.ssv@outlook.com>

pkgname=fvm
pkgver=3.1.3
pkgrel=1
pkgdesc="Flutter Version Management: A simple cli to manage Flutter SDK versions."
arch=('x86_64')
url="https://github.com/leoafarias/fvm"
license=('MIT')
depends=('git' 'zip' 'unzip' 'xz' 'curl' 'file' 'mesa')
optdepends=()
source=(
  "$url/releases/download/$pkgver/fvm-$pkgver-linux-x64.tar.gz"
)
conflicts=()
OPTIONS=()
sha256sums=(
  'a86aa8f218c9463c37c63db60c748a7816d40e6a600e75ba670fd264c82c985f'
)

package() {
  cd $srcdir

  tar -xf "fvm-${pkgver}-linux-x64.tar.gz"
  install -Dm755 "${srcdir}/fvm/fvm" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -Dm664 "${srcdir}/fvm/src/dart" "${pkgdir}/usr/share/${pkgname}/src/dart"
  install -Dm664 "${srcdir}/fvm/src/fvm.snapshot" "${pkgdir}/usr/share/${pkgname}/src/fvm.snapshot"
  install -Dm644 "${srcdir}/fvm/src/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  
  chmod +x "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  chmod +x "${pkgdir}/usr/share/${pkgname}/src/dart"

  ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
