# Maintainer:       baiyuanneko <i at nekomoe.xyz>
pkgname=bangumium-git
_pkgname=${pkgname%-git}
pkgver=v0.9.3.r0.0bb35fa
pkgrel=1
pkgdesc="Universal third-party desktop client for bgm.tv"
arch=('any')
url="https://github.com/Bangumium/Bangumium"
license=('MIT')
depends=('python-gobject' 'webkit2gtk-4.1')
makedepends=('git' 'npm' 'python' 'python-pip' 'nodejs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}::git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${_pkgname}"
}

build() {
    cd "$srcdir/${_pkgname}"
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements_linux.txt
    cd "$srcdir/${_pkgname}/frontend"
    npm install
    cd "$srcdir/${_pkgname}"
    bash ./build.sh
}

package() {
    cd "$srcdir/${_pkgname}/dist"
    install -Dm755 "bangumium" "${pkgdir}/usr/bin/bangumium"
    cd "$srcdir/${_pkgname}/"
    install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/bangumium.png"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << "EOF"
[Desktop Entry]
Name=Bangumium
Comment=Universal third-party desktop client for bgm.tv
Exec=/usr/bin/bangumium
Terminal=false
Icon=/usr/share/icons/bangumium.png
Type=Application
StartupNotify=false
Categories=Network
EOF
}
