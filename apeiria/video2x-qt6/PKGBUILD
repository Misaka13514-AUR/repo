# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-qt6
pkgver=6.4.0
pkgrel=1
pkgdesc="The Qt6 GUI for Video2X"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x-qt6"
license=('ISC')
depends=('video2x' 'qt6-base' 'qt6-svg' 'spdlog')
makedepends=('git' 'cmake' 'clang' 'qt6-tools')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('aa640b3c1c3e994038bfbb4dea638805343b0cc4ea92128aa04c34757f9d20665b715f0aa465b5d781dd1c26918e724e2cc153065bc396992e123f64afe15865')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ -DVIDEO2X_ENABLE_NATIVE=ON \
        -DUSE_EXTERNAL_VIDEO2X=ON
    cmake --build build --config Release --parallel
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

