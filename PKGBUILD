# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>

pkgname=speedynote-bin
pkgver=0.4.10
pkgrel=1
pkgdesc=" A simple note app with good performance and PDF import support "
arch=('x86_64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'poppler-qt6' 'sdl2-compat' 'hicolor-icon-theme')
conflicts=('speedynote-git')
source=("https://github.com/alpha-liu-01/SpeedyNote/releases/download/v${pkgver}-1/speedynote.deb")
sha256sums=('SKIP')

package() {
  bsdtar -xf "$srcdir/speedynote.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
}
