# Maintainer: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=hmcl
_pkgname=HMCL
pkgver=3.2.134
_pkgver=3.2
pkgrel=1
pkgdesc="Hello Minecraft! Launcher, a powerful Minecraft launcher."
arch=('x86_64')
license=('GPL3')
url="https://github.com/huanghongxun/HMCL"
depends=('java8-openjfx') #'java-openjfx>=8'
makedepends=('java-environment=8')
source=(
    "hmcl-launch-script"
    "${pkgname}.desktop"
    "${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('c6310315a7bc5f0512d1d307bdf1c4fffa3c55707f019274b32f9b2d132688d1'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            '2c80b3ff5348d54b51594b6e80f37acfcdd3e7eb4b3e95b60af37c16f999f375')
build() {
    cd "${_pkgname}-${pkgver}"
    export JAVA_HOME="/usr/lib/jvm/default/"
    sh gradlew build
}
package() {
    #custom launch script
    install -D -m755 "hmcl-launch-script" \
	    "${pkgdir}/usr/bin/$pkgname"
    #desktop file
    install -D -m644 "hmcl.desktop" \
	    "${pkgdir}/usr/share/applications/${pkgname}.desktop"


    cd "${_pkgname}-${pkgver}/${_pkgname}/build"
    #install license
    install -Dm644 "../../license-header.txt" \
	    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    #install jar
    install -Dm644 "libs/${_pkgname}-${_pkgver}.SNAPSHOT.jar" \
	    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    # install icon
    install -Dm644 "resources/main/assets/img/craft_table.png" \
	    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
}
