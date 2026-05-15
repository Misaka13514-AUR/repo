# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs
pkgver=1.2.9
pkgrel=1
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('x86_64')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse3' 'curl' 'expat' 'util-linux-libs' 'openssl')
makedepends=('meson' 'help2man' 'doxygen' 'graphviz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fangfufu/$pkgname/archive/$pkgver.tar.gz")
md5sums=("9a1c0ee68dae02d20d9685ce9703abf2")

build() {
  arch-meson "$pkgname-$pkgver" build -Dc_args="-std=gnu17"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
