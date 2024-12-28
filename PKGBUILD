# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-qt6
pkgver=6.3.1
_pkgver=678ebb5ef2fffd13bb00abaa403ffe306d3ee3fd
pkgrel=1
pkgdesc="The Qt6 GUI for Video2X"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x-qt6"
license=('ISC')
depends=('video2x' 'qt6-base' 'spdlog')
makedepends=('git' 'cmake' 'clang' 'qt6-tools')
provides=("${pkgname}")
conflicts=("${pkgname}")
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/678ebb5.tar.gz")
b2sums=('a30906f09d8e3329e301db4a9e0dd962d1ec852e86ae33598f081377f0440a30a28a48e97f78f7cf072ddd78239f2eb70d7965c608ee13bcf5f45c05a2862507')

build() {
    cmake -B build -S "${pkgname}-${_pkgver}" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ -DVIDEO2X_ENABLE_NATIVE=ON \
        -DUSE_EXTERNAL_VIDEO2X=ON
    cmake --build build --config Release --parallel
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

