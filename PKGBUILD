# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=easyeda-pro-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.57
pkgrel=1
pkgdesc="EasyEDA Professional Edition"
arch=('x86_64' 'aarch64')
url="https://pro.easyeda.com/"
license=('LicenseRef-EasyEDA-Proprietary')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-git $_pkgname-electron)
install=$pkgname.install
source=("LICENSE-$pkgver.html::https://easyeda.com/page/legal"
        "$pkgname.install")
source_x86_64=("$_pkgname-x86_64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-$pkgver.zip")
source_aarch64=("$_pkgname-aarch64-$pkgver.zip::https://image.easyeda.com/files/easyeda-pro-linux-arm64-$pkgver.zip")
sha256sums=('SKIP'
            'ab64abe7821e4ea37a0e4d1f77c94f37d6a51c7df2038ba7b609c640adf8e51d')
sha256sums_x86_64=('64e3c6bfa31917da0359eba17d457cbd3e8312e42db61a8a93e78c8ed91c18da')
sha256sums_aarch64=('ac873ac4bb2d9000e16e8895c1fb3daddb58a72d8bcde26b287888ae1d73c0ae')

package() {
    cd $srcdir
    install -Dm644 LICENSE-$pkgver.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html

    cd $srcdir/$_pkgname
    install -Dm644 EasyEDA-Distribution-License.txt \
                   $pkgdir/usr/share/licenses/$pkgname/EasyEDA-DLA.txt
    install -dm755 $pkgdir/opt/$_pkgname
    cp -dpr --no-preserve=ownership * $pkgdir/opt/$_pkgname
    rm -rf $pkgdir/opt/$_pkgname/icon
    rm -rf $pkgdir/opt/$_pkgname/easyeda-pro.dkt
    rm -rf $pkgdir/opt/$_pkgname/EasyEDA-Distribution-License.txt

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm644 icon/icon_${_icon}x${_icon}.png \
                       $pkgdir/usr/share/icons/hicolor/${_icon}x${_icon}/apps/$_pkgname.png
    done
    install -Dm644 icon/icon_512x512@2x.png \
                   $pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png

    # desktop entry
    install -Dm644 easyeda-pro.dkt \
                   $pkgdir/usr/share/applications/$_pkgname.desktop

    sed -i 's|/opt/easyeda-pro/icon/icon_128x128.png|easyeda-pro|g' \
        $pkgdir/usr/share/applications/$_pkgname.desktop
    sed -i 's|/opt/easyeda-pro/||g' \
        $pkgdir/usr/share/applications/$_pkgname.desktop

    # soft link
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
    chmod 755 $pkgdir/opt/$_pkgname/$_pkgname
}
