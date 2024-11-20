# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.24.2
pkgrel=1
pkgdesc="Toml sorting library"
arch=('any')
url="https://github.com/pappasam/toml-sort"
license=('MIT')
depends=('python' 'python-tomlkit' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d3020670057aef0c79226352c42df6a0f666e3266816e994f2f5d79e40dcae25')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
