_name=Telethon
pkgname=python-telethon
pkgver=1.17.4
pkgrel=1
pkgdesc="Full-featured Telegram client library for Python 3"
arch=(any)
url="https://github.com/LonamiWebs/Telethon"
license=('MIT')
depends=('python-pyaes' 'python-rsa')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/Telethon-1.17.4.tar.gz")
sha256sums=('edba701f63187d12707f09303dbd0f2515864bb7326c330a18adde12ef4ea635')

build() {
  cd "$srcdir/Telethon-1.17.4"
  python3 setup.py build
}

package() {
  cd "$srcdir/Telethon-1.17.4"
  python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # make sure we don't install annoying files
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$_site_packages/tests/"
}

