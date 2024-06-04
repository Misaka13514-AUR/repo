# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=turbocase
pkgver=1.6.1
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
sha256sums=('606f0d8a4d2e2e1051af38ceb31dfb16140303461f456917286abd22824f7c87')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
