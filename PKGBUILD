# Maintainer: Sébastien Luttringer

pkgname=bird
pkgver=2.0.0
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babbel routing daemon'
arch=('x86_64')
url='http://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses')
replaces=('bird6')
source=("ftp://bird.network.cz/pub/bird/$pkgname-$pkgver.tar.gz"
        'bird.service')
md5sums=('31cbd40f493d6e946e7cdf3158c4923a'
         '69221e063a3f07dcad519d5eeacaae75')

build() {
  cd $pkgbase-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/$pkgname
  make
}

package () {

  cd $pkgbase-$pkgver
  make \
    prefix="$pkgdir/usr" \
    sysconfdir="$pkgdir/etc" \
    sbindir="$pkgdir/usr/bin" \
    localstatedir="$pkgdir/var" \
    docdir="$pkgdir/usr/share/doc/$pkgname" \
    install

  # no /var inside pkg
  rm -r "$pkgdir/var"

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

# vim:set ts=2 sw=2 et:
