# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=2.3.0
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
  'git'
  'pybind11'
  'python-setuptools-scm'
)
source=("git+https://github.com/zxing-cpp/zxing-cpp.git#tag=v$pkgver"
        'git+https://github.com/zint/zint.git')
sha256sums=('1042010b960c29e6d7c5cd99e8c2a887cf84febb918abeb0405bcf12aaf8543c'
            'SKIP')

prepare() {
  cd "$_name"
  git submodule init
  git config submodule.zint.url "$srcdir/zint"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_name/wrappers/python"
  python setup.py build
}

package() {
  cd "$_name/wrappers/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
