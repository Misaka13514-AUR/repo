# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.35.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://imhex.werwolv.net'
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('glfw' 'mbedtls' 'curl' 'dbus'
         'freetype2' 'file' 'hicolor-icon-theme' 'xdg-desktop-portal'
         'fmt' 'yara' 'capstone')
makedepends=('cmake'
             'llvm' 'librsvg' 'nlohmann-json'
             'python' 'cli11' 'dotnet-runtime')
optdepends=('dotnet-runtime: support for .NET scripts')
provides=('imhex-patterns')
conflicts=('imhex-patterns-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WerWolv/ImHex/releases/download/v$pkgver/Full.Sources.tar.gz"
"imhex-patterns-$pkgver.tar.gz::https://github.com/WerWolv/ImHex-Patterns/archive/refs/tags/ImHex-v$pkgver.tar.gz")
sha256sums=('0af5f14fd95027612b8093b2c6c99c9a0734d791ee6451c7b8fda18ef1dc8799'
            '95dd4b5d316d4b8af8e7f40a856d2705d880076df176c498385af34bd1489f79')
b2sums=('d77400a36be3b38206e68c51aa23b3e32c244c3fe98856797adc34d0323aa7f2250d027887a83bf4edd335be2364a88192b1067a65456f501448b39afd6883d7'
        'f7d1bdaa51f7f8e35222546f33afe8929e5a648579366a2a163d27cd148ac8e08809f15fade3f962f14498e7083e23c9c9fb385082bd37b4ac2d2e3477155785')
options=(!lto !strip)

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-inconsistent-missing-override"

  cmake -B build -S "$_pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D IMHEX_OFFLINE_BUILD=ON \
    -D IMHEX_IGNORE_BAD_CLONE=ON \
    -D IMHEX_STRIP_RELEASE=OFF \
    -D IMHEX_STRICT_WARNINGS=OFF \
    -D IMHEX_BUNDLE_DOTNET=OFF \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D USE_SYSTEM_CAPSTONE=ON \
    -D USE_SYSTEM_CLI11=ON \
    -D IMHEX_VERSION="$pkgver"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Remove updater
  rm "$pkgdir/usr/bin/imhex-updater"

  # Patterns
  install -dm0755 "$pkgdir/usr/share/imhex"
  cp -r -t "$pkgdir/usr/share/imhex" \
    "$srcdir/ImHex-Patterns-ImHex-v$pkgver"/{constants,encodings,includes,magic,nodes,patterns,plugins,scripts,tests,themes,tips,yara}

  # Desktop file(s)
  install -Dm0644 "$_pkgname/resources/icon.png" "$pkgdir/usr/share/pixmaps/imhex.png"

  # Documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$_pkgname/README.md"
}
