# Maintainer: Alessandro Marchioro <marciozgaming@gmail.com>
pkgname=apple-fonts
pkgver=1.0.2
pkgrel=1
pkgdesc="Apple San Francisco, New York fonts, directly from Apple official source"
arch=(x86_64)
url="https://developer.apple.com/fonts/"
depends=()
makedepends=(curl p7zip)
optdepends=()
provides=()

package() {
    mkdir $pkgdir/fontfiles/

    curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
    7z x SF-Pro.dmg
    cd SFProFonts
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg
    7z x SF-Compact.dmg
    cd SFCompactFonts
    7z x 'SF Compact Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg
    7z x SF-Mono.dmg
    cd SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    curl -O https://devimages-cdn.apple.com/design/resources/download/NY.dmg
    7z x NY.dmg
    cd NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    rm -r *.dmg NYFonts SFCompactFonts SFProFonts SFMonoFonts

    mkdir -p $pkgdir/usr/share/fonts/OTF $pkgdir/usr/share/fonts/TTF
    mv $pkgdir/fontfiles/*.otf $pkgdir/usr/share/fonts/OTF
    mv $pkgdir/fontfiles/*.ttf $pkgdir/usr/share/fonts/TTF
    rm -rf $pkgdir/fontfiles
}
