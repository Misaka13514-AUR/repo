_name=Telethon
pkgname=python-telethon
pkgver=1.17.0
pkgrel=1
pkgdesc="Full-featured Telegram client library for Python 3"
arch=(any)
url="https://github.com/LonamiWebs/Telethon"
license=('MIT')
depends=('python-pyaes' 'python-rsa')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/Telethon-1.17.0.tar.gz")
sha256sums=('dd38dd46dfd023cfdf9158f0b730c181ebff89a3b78408e7301552b543b62b92')

build() {
  cd "$srcdir/Telethon-1.17.0"
  python3 setup.py build
}

package() {
  cd "$srcdir/Telethon-1.17.0"
  python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # make sure we don't install annoying files
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$_site_packages/tests/"
}

