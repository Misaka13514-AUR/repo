# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: bgh <aur at bgh dot io>

pkgname="cyberchef-web"
pkgver=10.13.0
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis"
url="https://gchq.github.io/CyberChef/"
license=("Apache-2.0")
arch=("any")
conflicts=("cyberchef-html")
replaces=("cyberchef-html")
makedepends=("findutils" "libarchive")
source=("$pkgname-$pkgver.zip::https://github.com/gchq/CyberChef/releases/download/v$pkgver/CyberChef_v$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")
b2sums=('00f632c3f0418cf8f4b850085bb4d7a3cb7e1bf328fac3eb31d02f31060a683056045fcca0e999dc1e910accd30d8c46e5a63ce91a3ac7e887627376db31bc7d')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/cyberchef"
 install -d "$pkgdir/usr/share/licenses/cyberchef"
 bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$pkgdir/usr/share/webapps/cyberchef" --no-same-permissions
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
 find "$pkgdir/usr/share/webapps/cyberchef/" -type f -name "*LICENSE*" -exec mv {} "$pkgdir/usr/share/licenses/cyberchef" \;
}
