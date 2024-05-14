# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=yubico-authenticator
_app_id=com.yubico.yubioath
pkgdesc="Yubico Authenticator for Desktop"
pkgver=7.0.0
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache-2.0')
depends=(
  'ccid'
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'pcsclite'
  'python-mss'
  'python-pillow'
  'python-zxing-cpp'
  'yubikey-manager'
)
makedepends=(
  'chrpath'
  'clang'
  'cmake'
  'fvm'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
source=("git+https://github.com/Yubico/yubioath-flutter.git#tag=$pkgver?signed")
sha256sums=('e728ae5c5e94f7ed9b92a76e1e5dc91a6e4775da265b51379f027bf47f6bf84d')
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8')  # Dain Nilsson <dain@yubico.com>

prepare() {
  cd yubioath-flutter
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install stable
  fvm global stable

  # Disable analytics and enable linux desktop
  fvm flutter --no-version-check config --no-analytics
  fvm flutter --no-version-check config --enable-linux-desktop

  # Because yubico_authenticator depends on flutter_localizations from sdk 
  # which depends on intl 0.19.0, intl 0.19.0 is required.
  # So, because yubico_authenticator depends on intl ^0.18.1, version solving failed.
  fvm flutter pub add intl:^0.19.0

  # Pull dependencies within prepare, allowing for offline builds later on
  fvm flutter --no-version-check pub get

  desktop-file-edit --set-key=Exec --set-value="authenticator" --set-icon="${_app_id}" \
    resources/linux/linux_support/com.yubico.authenticator.desktop

  # Don't copy the Helper since we're not using Pyinstaller
  sed -i '/build\/linux\/helper/d' linux/CMakeLists.txt
}

build() {
  cd yubioath-flutter

  pushd helper
  GIT_DIR='.' python -m build --wheel --no-isolation
  popd

  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter --no-version-check build linux
}

check() {
  cd yubioath-flutter
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter --no-version-check test
}

package() {
  cd yubioath-flutter

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  pushd helper
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 authenticator-helper.py "$pkgdir/opt/$pkgname/helper/authenticator-helper"
  install -Dm755 shell.py -t "$pkgdir/opt/$pkgname/helper/"
  popd

  install -Dm755 build/linux/${FLUTTER_ARCH}/release/bundle/authenticator -t \
    "$pkgdir/opt/$pkgname/"
  cp -r build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/authenticator" "$pkgdir/usr/bin/"

  install -Dm644 "resources/icons/${_app_id}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -Dm644 "resources/icons/${_app_id}-32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_app_id}.png"
  install -Dm644 "resources/icons/${_app_id}-1000x1000.png" \
    "$pkgdir/usr/share/icons/hicolor/1000x1000/apps/${_app_id}.png"
  install -Dm644 resources/linux/linux_support/com.yubico.authenticator.desktop -t \
    "$pkgdir/usr/share/applications/"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}
