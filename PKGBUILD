# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgver=6.0.3
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
depends=('libunwind')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs !strip)
install=powershell.install
md5sums=('1ac9d51461f18e149f0fdc6affcbc0a1')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell_${_pkgver}-1.ubuntu.16.04_amd64.deb")

package() {
  bsdtar xf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  cp -r usr/local/share usr
  rm -rf usr/local

  chmod 755 opt/microsoft/powershell/$_pkgver/pwsh
}
