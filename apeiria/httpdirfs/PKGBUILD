# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs
pkgver=1.2.7
pkgrel=3
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('x86_64')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse3' 'curl' 'expat' 'util-linux-libs' 'openssl')
makedepends=('meson' 'help2man' 'doxygen' 'graphviz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fangfufu/$pkgname/archive/$pkgver.tar.gz"
        "httpdirfs.patch")
md5sums=("1e7d3ed7850d7a629e31b635e5954046"
         "2189af12e067eba640b76c39b42c3348")

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
