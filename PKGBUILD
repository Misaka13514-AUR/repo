# Maintainer: Glucy2 <glucy-2@outlook.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=bash-pinyin-completion-rs
_tagname=0.2.3
pkgver="0.2.3"
pkgrel="2"
pkgdesc="Simple completion script for pinyin, written in rust."
arch=(
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'aarch64'
  'loongarch64'
  'mips64'
  'mips64el'
  'riscv64'
  )
depends=('bash-completion' 'bash-completion' 'glibc' 'gcc-libs')
makedepends=('rust')
url="https://github.com/AOSC-Dev/bash-pinyin-completion-rs"
license=('GPL-3.0-only')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AOSC-Dev/bash-pinyin-completion-rs/archive/refs/tags/v${_tagname}.tar.gz")

sha256sums=("53cb5dc97fe13fefe0d3c8d165e4167e60639a0cd1f7dae81cf70b075b1e9829")

prepare() {
  cd "$pkgname-$_tagname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/bash-pinyin-completion-rs-${_tagname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$_tagname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$_tagname"
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/bash-pinyin-completion-rs
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" scripts/bash_pinyin_completion
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" scripts/bash_pinyin_completion_debug
}

post_install() {
  printf '\033[1;36m==> Remember to enable bash-pinyin-completion-rs in your .bashrc\033[m\n'
  printf '\033[1;36m==> (add the following line):\033[m\n'
  printf '\033[1;35msource /usr/share/bash-pinyin-completion-rs/bash_pinyin_completion\033[m\n'
}
