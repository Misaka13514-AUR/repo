# Maintainer: Root-Core <aur at root-core dot net>
_pkgname=MiniLPA
pkgname=minilpa
pkgver=1.1.1
pkgrel=1
pkgdesc="Professional LPA UI"
arch=('x86_64')
url="https://github.com/EsimMoe/MiniLPA"
license=('AGPL-3.0')
makedepends=('powershell-bin' 'jdk-openjdk')
depends=('java-runtime-common')
provides=("minilpa")
conflicts=("minilpa")
source=(
  $_pkgname-$pkgver.tar.gz::https://github.com/EsimMoe/MiniLPA/archive/refs/tags/v$pkgver.tar.gz
  $pkgname.desktop
  $pkgname.sh
)
sha256sums=(
  a56a8342215d25d127bdc17fb3bc2e569eb4b28bb2043ee81407ff59373e4218
  c3f3c4f24581d89af194e6605eb3fdac59612752b94e6841d15aff927d812a13
  89bd22e555dbd9eb8a9fee7cbdfd8f21c05120141cc4edef38d4c65ac4615ed0
)

build() {
  cd $srcdir/$_pkgname-$pkgver
  pwsh scripts/Build.ps1 -NativeExecutable -NativeExecutableType app-image
}

package() {
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  cd $srcdir/$_pkgname-$pkgver
  cd build/dist
  bsdtar -xf MiniLPA-Linux-x86_64.zip
  install -Dm755 lib/app/MiniLPA-all.jar $pkgdir/usr/lib/$pkgname/MiniLPA.jar
  install -Dm644 lib/MiniLPA.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png
}
