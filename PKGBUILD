# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya
pkgver=1.1.3
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('GPL3')
depends=('glibc' 'v2ray')
makedepends=('go>=2:1.12.3-1' 'nodejs>=14' 'yarn' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/v2rayA/v2rayA/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
    cd "$srcdir/v2rayA-$pkgver/gui"
    yarn config set registry https://registry.npm.taobao.org
    yarn config set sass_binary_site https://cdn.npm.taobao.org/dist/node-sass -g
    yarn --check-files
    yarn build

    cd "$srcdir/v2rayA-$pkgver/service"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.io
    CGO_ENABLED=0 go build -ldflags '-X github.com/v2rayA/v2rayA/global.Version='$pkgver' -s -w -extldflags "-static"' -o v2raya
}

package() {
    cd "${srcdir}"/"v2rayA-${pkgver}"/
    install -Dm 755 service/v2raya -t "${pkgdir}"/usr/bin/
    find web -type d -exec install -vd "${pkgdir}"/etc/v2raya/{} \;
    find web -type f -exec install -vm 644 {} "${pkgdir}"/etc/v2raya/{} \;
    install -dm 750 "${pkgdir}"/etc/v2raya/
    install -Dm 644 install/universal/v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 install/universal/v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 gui/public/img/icons/android-chrome-512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
