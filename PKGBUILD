_pkgname=Telethon
pkgname=python-telethon
pkgver=0.15.3.2
pkgrel=1
pkgdesc="Full-featured Telegram client library for Python 3"
arch=('any')
url="https://github.com/LonamiWebs/Telethon"
license=('MIT')
depends=('python' 'python-pyaes' 'python-rsa' 'python-setuptools')
source=('https://pypi.python.org/packages/e4/c8/f4e900e64d5b26ed9f33a17d9d5e008977889a2c6c8a2272f5e3e0345dbd/Telethon-0.15.3.2.tar.gz')
md5sums=('d1d4d96a8dd3d762e505dce2bccba629')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
