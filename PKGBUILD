# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya
pkgver=0.3.2
pkgrel=1
pkgdesc="V2RayA是一个支持全局透明代理的V2Ray Linux客户端。"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/V2RayA"
license=('GPL')
depends=('glibc' 'v2ray')
makedepends=('go>=2:1.11.3-1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mzz2017/V2RayA/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

prepare() {
    export GO111MODULE=on
}

build() {
    cd "V2RayA-$pkgver/service"
    go build -mod=vendor -ldflags='-X global.Version=$pkgver' -o v2raya
}

package() {
    cd "V2RayA-$pkgver"
    install -Dm644 "install/v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "service/v2raya" -t "$pkgdir/usr/bin/"
}
