# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=2.2.0
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'cmake'
  'pybind11'
  'python-setuptools-scm'
)
source=("$_name-$pkgver.tar.gz::https://github.com/zxing-cpp/zxing-cpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6df336573c777d0d826f4993d06c4feeebe5a8f97e1c8e80a6e6233fe7c62eac')

build() {
  cd "$_name-$pkgver/wrappers/python"
  python setup.py build
}

package() {
  cd "$_name-$pkgver/wrappers/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
