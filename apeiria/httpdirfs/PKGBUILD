# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs
pkgver=1.2.11
pkgrel=2
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('x86_64')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse3' 'curl' 'expat' 'util-linux-libs' 'openssl')
makedepends=('meson' 'help2man' 'doxygen' 'graphviz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fangfufu/$pkgname/archive/$pkgver.tar.gz"
         "httpdirfs.patch")
md5sums=("6a0f00154d3c20ec03363be7abe200f9"
         "068486cabbb5818ba1e019976f2ed340")

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../httpdirfs.patch
}

build() {
  arch-meson "$pkgname-$pkgver" build -Dc_args="-std=gnu17"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
