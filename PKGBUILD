# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=turbocase
pkgver=1.5.0
pkgrel=1
pkgdesc="Generate an OpenSCAD case template from a KiCAD PCB"
arch=('any')
url="https://git.sr.ht/~martijnbraam/turbocase"
license=('MIT')
depends=('python' 'python-sexpdata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3469bbf33920423b113dbc66673470a8330e77507ba094590e7475f023a54f67')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
