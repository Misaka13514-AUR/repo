# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya
pkgver=0.6.8
pkgrel=1
install=.INSTALL
pkgdesc="V2Ray Linux client with web GUI, compatible with SS and SSR, supporting transparent proxy"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/V2RayA"
license=('GPL')
depends=('glibc' 'v2ray')
makedepends=('go>=2:1.12.3-1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mzz2017/V2RayA/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
    cd "V2RayA-$pkgver/service"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.io
    go build -ldflags="-X V2RayA/global.Version=$pkgver" -o v2raya
}

package() {
    cd "V2RayA-$pkgver"
    
    install -Dm644 "install/universal/v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "service/v2raya" -t "$pkgdir/usr/bin/"

    install -Dm644 "gui/public/img/icons/android-chrome-512x512.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "install/universal/v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
