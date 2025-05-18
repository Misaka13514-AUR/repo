# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=hp-prime-virtual-calculator-bin
_pkgname=${pkgname%-bin}
_pkgver=2025_01_31
pkgver=2.2.15270_$_pkgver
pkgrel=1
pkgdesc="Simulator of the HP Prime Graphing Calculator (using Wine)"
arch=('x86_64')
url="https://hpcalcs.com"
license=('LicenseRef-Hewlett-Packard')
depends=('wine' 'hicolor-icon-theme' 'bash')
makedepends=('binwalk' 'msitools' 'cabextract')
optdepends=('wine-staging: The recommended version of Wine for this package')
provides=($_pkgname)
conflicts=($_pkgname)
install="$_pkgname.install"
_binname="HP_Prime_Virtual_Calculator_x64_$_pkgver.exe"
source=("$_binname::https://www.hpcalc.org/prime/pc/$_binname"
        "$_pkgname.sh"
        "$_pkgname.desktop")
noextract=("$_binname")
sha256sums=('9858c0a3a889144ba17df351360effde759ba993a13ab1dd4b51b3e754654f2f'
            'ee62acad0d2e261ffd2714b3a977ff873e57fd01799efb4e1dc9507676425c73'
            'c7ead1fad1707720e65a53348be12c43c5d152681b5b139a4542aaee6909fa6a')

prepare() {
  binwalk -C "$srcdir/$pkgname-$pkgver-binwalk" -e "$_binname"
  msiextract -C "$srcdir/$pkgname-$pkgver-msi" "$pkgname-$pkgver-binwalk/$_binname.extracted/D10A8/a2"
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname-$pkgver-msi/HP/HP Prime Virtual Calculator/"* "$pkgdir/opt/$_pkgname"
  find "$pkgdir/opt/$_pkgname" -type f -exec chmod 644 "{}" \;
  find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 "{}" \;

  # license
  install -dm755 "$pkgdir/usr/share/licenses"
  ln -sf /opt/$_pkgname/eula "$pkgdir/usr/share/licenses/$pkgname"

  # doc
  install -dm755 "$pkgdir/usr/share/doc"
  ln -sf /opt/$_pkgname/docs "$pkgdir/usr/share/doc/$pkgname"

  # icon
  install -Dm644 "$srcdir/$pkgname-$pkgver-binwalk/$_binname.extracted/699D8/image.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

  # bin
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
