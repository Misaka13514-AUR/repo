# Maintainer: Sébastien Luttringer
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=bird
pkgver=2.15.1
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL-2.0-or-later')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses' 'libssh')
replaces=('bird6')
options=(!emptydirs)
source=("https://gitlab.nic.cz/labs/bird/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'bird.service')
sha256sums=('5a4cf55c4767192aa57880ac5f6763e5b8c26f688ab5934df96e3615c4b0a1e1'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

prepare() {
  cd $pkgbase-v$pkgver
  autoreconf -vif
}

build() {
  cd $pkgbase-v$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/$pkgname \
    --docdir=/usr/share/doc/$pkgname
  make
}

package () {
  cd $pkgbase-v$pkgver
  make DESTDIR="$pkgdir" install

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

# vim:set ts=2 sw=2 et:
