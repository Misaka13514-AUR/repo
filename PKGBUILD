# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yarg
_name=${pkgname#python-}
pkgver=0.1.9
pkgrel=11
pkgdesc="A semi hard Cornish cheese, also queries PyPI (PyPI client)"
url="https://github.com/kura/yarg"
license=('MIT')
arch=('any')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	      'drop-python-mock-dependency.patch')
sha512sums=('1083608b0c2f84d15c27af9c9fbaf802e9f770518fc2c46bd6ba07d2123d4ad0a9ac7673a14714e579664ffef44667a21d1bec6417d9075c315749175bcd8fd9'
            'd0872a7b69b1aa3c91fd85b32163e9f15212e03f4602e789caa23e3627fc969363ee423d9e2beef130cb09c6a14c78058a3f45c73d0ef3880e810bdb15d195a8')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ${srcdir}/drop-python-mock-dependency.patch
  # replace assertEquals with assertEqual
  # https://docs.python.org/3.11/library/unittest.html#deprecated-aliases
  find -type f -print -exec sed -i 's/assertEquals/assertEqual/g' {} \;
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  nosetests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "$pkgdir$site_packages"/{,yarg/}tests
}
