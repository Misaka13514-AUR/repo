# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>
pkgname=speedynote-git
pkgver=r25.74044c9
pkgrel=1
pkgdesc=" A simple note app with good performance and PDF import support "
arch=('x86_64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'poppler-qt6' 'sdl2-compat' 'hicolor-icon-theme')
conflicts=('speedynote-bin')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools' 'qt5-translations')
source=(
  "git+https://github.com/alpha-liu-01/SpeedyNote.git#branch=linux"
  "speedynote.desktop"
  "speedynote.png"
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/SpeedyNote"
  git describe --long 2>/dev/null || echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/SpeedyNote"
  git checkout linux

  lrelease resources/translations/app_zh.ts \
    resources/translations/app_fr.ts \
    resources/translations/app_es.ts

  cmake -B build -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/SpeedyNote"

  # install main application
  install -Dm755 build/NoteApp "$pkgdir/usr/bin/speedynote"

  # install translations
  install -d "$pkgdir/usr/share/speedynote/translations"
  install -m644 build/app_*.qm "$pkgdir/usr/share/speedynote/translations/"

  # install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install .desktop
  install -Dm644 "$srcdir/speedynote.desktop" "$pkgdir/usr/share/applications/speedynote.desktop"

  # install icon
  install -Dm644 "$srcdir/speedynote.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/speedynote.png"
}
