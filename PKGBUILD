# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-lzf
_name=${pkgname}
pkgver=0.2.5
pkgrel=1
pkgdesc="C Extension for liblzf"
arch=('x86_64')
url="https://github.com/teepark/python-lzf"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('114c694969046a4f77f68571d88ff86235d3161670178547e89b183e6e7d50ce')

build() {
    cd "$_name-release-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-release-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
