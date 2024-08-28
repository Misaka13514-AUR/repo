# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=lceda-pro-bin
_pkgname=${pkgname%-bin}
pkgver=2.2.26.6
pkgrel=1
pkgdesc="免费、专业、强大的国产PCB设计工具"
arch=('x86_64' 'aarch64')
url="https://pro.lceda.cn/"
license=('LicenseRef-LCEDA-Proprietary')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=()
backup=()
#options=('!strip')
install=${pkgname}.install
source=("LICENSE-$pkgver.html::https://lceda.cn/page/legal"
        "${pkgname}.install")
source_x86_64=("${_pkgname}-x86_64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-${pkgver}.zip")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-arm64-${pkgver}.zip")
# source_loong64=("${_pkgname}-loong64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-loong64-${pkgver}.zip")
sha256sums=('SKIP'
            'afba3c6712227a37c08783b3cc1a97ae71e90dc2f575409213d2773372220697')
sha256sums_x86_64=('ff524818d21e931a04b79c95f69c6e298b5b79e72f95c39f4f67e26f4607cd4c')
sha256sums_aarch64=('5c3b9228574433af8cd52adce1912aca4326249d0e8d5762862c7008257d6a4a')
# sha256sums_loong64=('SKIP')

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/opt/${_pkgname}/"

    cd "${srcdir}/${_pkgname}"
    mv * "${pkgdir}/opt/${_pkgname}/"

    cd "${pkgdir}/opt/${_pkgname}/"
    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm0644 "icon/icon_${_icon}x${_icon}.png" \
                        "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png"
    done
    install -Dm0644 "icon/icon_512x512@2x.png" \
                    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    rm -rf icon

    # desktop entry
    install -Dm0644 lceda-pro.dkt \
                    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    sed -i 's|/opt/lceda-pro/icon/icon_128x128.png|lceda-pro|g' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i 's|/opt/lceda-pro/||g' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf lceda-pro.dkt

    # fix permissions
    find "${pkgdir}/opt/${_pkgname}/" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/${_pkgname}/" -type d -exec chmod 755 {} \;
    chmod 0755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    chmod 0755 "${pkgdir}/opt/${_pkgname}/chrome_crashpad_handler"

    # soft link
    install -dm0755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/${_pkgname}" \
          "${pkgdir}/usr/bin/${_pkgname}"

    # LICENSE
    install -Dm0644 ${srcdir}/LICENSE-$pkgver.html ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html
}
