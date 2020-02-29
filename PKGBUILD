# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=hmcl
_pkgname=HMCL
pkgver=3.2.140
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular"
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
provides=('hmcl')
conflicts=('hmcl')
depends=('java8-openjfx')
makedepends=('jdk8-openjdk')
source=("hmcl-launch-script"
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c6310315a7bc5f0512d1d307bdf1c4fffa3c55707f019274b32f9b2d132688d1'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            '2a2a03bdd99257a61ce778dd97a9db367816ecc91917160ed2b82f9ea86d087f')

prepare() {
    cd "${_pkgname}-${pkgver}"
    # Fix license check
    sed "s/\${year}/2019/" license-header.txt -i
}

build() {
    cd "${_pkgname}-${pkgver}"
    _java=$(ls /usr/lib/jvm | grep 8-openjdk)
    export JAVA_HOME=/usr/lib/jvm/$_java
    sh gradlew build
}

package() {
    # custom launch script
    install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/$pkgname"
    # desktop file
    install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cd "${_pkgname}-${pkgver}/${_pkgname}/build"

    # install jar
    _path=$(echo libs/HMCL*.jar)
    install -Dm644 $_path "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    # install icon
    install -Dm644 "resources/main/assets/img/craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
}
