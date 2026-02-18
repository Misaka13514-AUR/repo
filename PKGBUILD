# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: awh
pkgname=python-pytweening
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=3
pkgdesc="A set of tweening / easing functions implemented in Python."
arch=('any')
url="https://github.com/asweigart/pytweening"
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('243318b7736698066c5f362ec5c2b6434ecf4297c3c8e7caa8abfe6af4cac71b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
