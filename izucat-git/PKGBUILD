# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer: Ameyama Izumi <souiken@oneamongus.ca>

pkgname=izucat-git
_pkgname=${pkgname%-git}
pkgver=r15.7c30580
pkgrel=1
pkgdesc="A program that can recursively concatenate (cat) text and binary files in a path to typst."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Souiken/izucat"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
optdepends=('typst: for generating pdf'
            'otf-unifont: font for pdf generation')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
