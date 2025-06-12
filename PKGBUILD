# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=bash-pinyin-completion-rs
pkgver="0.2.3"
pkgrel="1"
pkgdesc=" Simple completion script for pinyin, written in rust."
arch=(
  'x86_64'
  'aarch64'
  'loongarch64'
  'mips64'
  'mips64el'
  'riscv64'
  )
depends=('bash-completion')
makedepends=('rust')
url="https://github.com/AOSC-Dev/bash-pinyin-completion-rs"
license=('GPL-3.0')

source=("https://github.com/AOSC-Dev/bash-pinyin-completion-rs/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=("53cb5dc97fe13fefe0d3c8d165e4167e60639a0cd1f7dae81cf70b075b1e9829")

build() {
  cd "${srcdir}/bash-pinyin-completion-rs-${pkgver}"
  cargo build --release
}

package() {
  install -Dm644 "${srcdir}/bash-pinyin-completion-rs-${pkgver}/scripts/bash_pinyin_completion" \
    "${pkgdir}/etc/bash_completion.d/bash_pinyin_completion"
  install -Dm755 "${srcdir}/bash-pinyin-completion-rs-${pkgver}/target/release/bash-pinyin-completion-rs" \
    "${pkgdir}/usr/bin/bash-pinyin-completion-rs"
}
