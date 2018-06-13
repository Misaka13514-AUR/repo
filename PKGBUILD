# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
binaryname=pwsh
_pkgver=6.0.2
pkgver=${_pkgver/-/.}
pkgrel=3
pkgdesc='A cross-platform automation and configuration tool/framework (latest release)'
arch=('x86_64')
url='https://github.com/PowerShell/PowerShell'
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk>=2.0')
depends=('icu')
source=($pkgname::git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver
        pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop
        googletest::git+https://github.com/google/googletest.git
        build.sh
        dotnet-version.patch)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '477e7fe74b41d814da19ec23db3e620f'
         '835214e5782a09d6be7796d9da3d42f6')
install=powershell.install

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url $srcdir/pester
  git config submodule.src/libpsl-native/test/googletest.url $srcdir/googletest
  git submodule update
  git clean -dfx

  cat $srcdir/dotnet-version.patch | patch -p1
}

build() {
  cd $pkgname
  TERM=xterm $srcdir/build.sh
}

check() {
  cd $pkgname/src/libpsl-native
  make test
}

package() {
  cd $pkgname/src/powershell-unix

  mkdir -p $pkgdir/usr/lib/$pkgname
  cp -a bin/Linux/netcoreapp*/linux-x64 $pkgdir/usr/lib/$pkgname
  chmod 755 $pkgdir/usr/lib/$pkgname/linux-x64/$binaryname

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp ../../LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  mkdir -p $pkgdir/usr/bin
  ln -s /usr/lib/$pkgname/linux-x64/$binaryname $pkgdir/usr/bin/$binaryname

  chmod 644 \
    $pkgdir/usr/lib/powershell/linux-x64/libhostfxr.so \
    $pkgdir/usr/lib/powershell/linux-x64/libhostpolicy.so \
    $pkgdir/usr/lib/powershell/linux-x64/en-US/default.help.txt \
    $pkgdir/usr/lib/powershell/linux-x64/Modules/PSDesiredStateConfiguration/PSDesiredStateConfiguration.psm1
}
