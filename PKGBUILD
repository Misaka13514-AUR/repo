# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.24.0
pkgrel=1
pkgdesc="Toml sorting library"
arch=('any')
url="https://github.com/pappasam/toml-sort"
license=('MIT')
depends=('python' 'python-tomlkit' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7386e4dc8a1a674d0fab907abf5f02961702c3aefe8c0ae18ad2eb5c6cebd479')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
