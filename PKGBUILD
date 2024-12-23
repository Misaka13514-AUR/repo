# Maintainer: K4YT3X <aur@k4yt3x.com>
# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
pkgname=video2x
pkgver=6.3.1
pkgrel=1
pkgdesc="A machine learning-based video super resolution and frame interpolation framework"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x"
license=('AGPL-3.0-only')
depends=('ffmpeg' 'ncnn' 'vulkan-driver' 'spdlog' 'boost-libs')
makedepends=('git' 'cmake' 'clang' 'vulkan-headers' 'openmp' 'boost')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+${url}.git#tag=${pkgver}"
        "git+https://github.com/k4yt3x/libreal-esrgan-ncnn-vulkan.git"
	    "git+https://github.com/k4yt3x/librealcugan-ncnn-vulkan.git"
	    "git+https://github.com/k4yt3x/librife-ncnn-vulkan.git")
b2sums=('f8b078d2440d4f28a4cf87566580d84a1d9856184901349b1b467426ad882edeb0afbfb98f13e2588913aaa2ec230a3c06a271291023271789dc9d81d1ee7a3b'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    git rm third_party/{ncnn,spdlog,boost}
    git submodule init
	git config submodule.third_party/libreal_esrgan_ncnn_vulkan.url "${srcdir}/libreal-esrgan-ncnn-vulkan"
	git config submodule.third_party/librealcugan_ncnn_vulkan.url "${srcdir}/librealcugan-ncnn-vulkan"
	git config submodule.third_party/librife_ncnn_vulkan.url "${srcdir}/librife-ncnn-vulkan"
	git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "${pkgname}" -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=clang++ -DVIDEO2X_ENABLE_NATIVE=ON
    cmake --build build --config Release --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

