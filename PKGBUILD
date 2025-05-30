# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Sébastien Luttringer
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=bird2
_pkgname=bird
pkgver=2.15.1
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL-2.0-or-later')
depends=('glibc' 'readline' 'ncurses' 'libssh')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=('bird6')
backup=('etc/bird.conf')
source=("https://gitlab.nic.cz/labs/bird/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz"
        'bird.service')
sha256sums=('5a4cf55c4767192aa57880ac5f6763e5b8c26f688ab5934df96e3615c4b0a1e1'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

prepare() {
  cd $_pkgname-v$pkgver
  autoreconf -vif
}

build() {
  cd $_pkgname-v$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/$pkgname \
    --docdir=/usr/share/doc/$pkgname
  make
}

check() {
  cd $_pkgname-v$pkgver
  make check
}

package() {
  cd $_pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/run" # Remove installed runstatedir, should not be packaged.

  # systemd
  install -vD -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/bird.service"
}

# vim:set ts=2 sw=2 et:
