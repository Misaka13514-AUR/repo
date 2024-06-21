# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=turbocase
pkgver=1.7.1
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
sha256sums=('c13dfa1714d4fae9b7c652161c289abcae2b6b7c060d07e914ad5284c245c4be')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
