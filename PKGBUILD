# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=powershell
_pkgver=6.0.0-alpha.17
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'proot' 'dotnet-bin')
depends=('bash' 'icu55')
conflicts=('powershell-git')
source=($pkgname::git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver
        pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop
        googletest::git+https://github.com/google/googletest.git
        os-release
        build.sh)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'f5841baa62b1322c07f9394940cec818'
         'd20378ea8504200919c65de6592f0b24')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url "$srcdir"/pester
  git config submodule.src/libpsl-native/test/googletest.url "$srcdir"/googletest
  git submodule update

  # Starting off clean.
  git clean -dfx
}

build() {
  cd $pkgname

  pushd src/libpsl-native
  cmake .
  make -j
  popd

  PROOT_NO_SECCOMP=1 \
  proot -b "$srcdir"/os-release:/etc/os-release "$srcdir"/build.sh
}

check() {
  cd $pkgname/src/libpsl-native

  PROOT_NO_SECCOMP=1 \
  proot -b "$srcdir"/os-release:/etc/os-release \
  make test
}


package() {
  cd $pkgname/src/powershell-unix

  mkdir -p "$pkgdir"/usr/lib/$pkgname
  cp -a bin/Linux/netcoreapp*/ubuntu.16.04-x64 "$pkgdir"/usr/lib/$pkgname

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cp ../../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/$pkgname/ubuntu.16.04-x64/powershell "$pkgdir"/usr/bin/powershell
}
