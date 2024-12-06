# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-legacy
pkgver=24.35.30872.22
pkgrel=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (legacy platforms)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=('gcc-libs' 'intel-gmmlib-legacy' 'intel-graphics-compiler-legacy')
makedepends=('cmake' 'igsc-legacy' 'libva' 'level-zero-headers-legacy' 'opencl-headers')
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=("intel-compute-runtime=${pkgver}" 'opencl-driver' 'level-zero-driver')
conflicts=('intel-compute-runtime')
# https://github.com/intel/compute-runtime/issues/528
options=('!lto')
source=("https://github.com/intel/compute-runtime/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-intel-compute-runtime-disable-werror.patch')
sha256sums=('924781eba2268aaf3f2f5286006e219f8adff9b985a327ccf6acc39b7a00acc5'
            'b98774fd019281d3a9bd6109d9fbaaae866e2ae4581397b582cdf454a29433e5')

prepare() {
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/010-intel-compute-runtime-disable-werror.patch"
}

build() {
    # fix runtime error in blender
    CXXFLAGS+=' -DSANITIZER_BUILD=1'
    CFLAGS+=' -DSANITIZER_BUILD=1'
    
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # tests currently disabled because of https://github.com/intel/compute-runtime/issues/599
    cmake -B build -S "compute-runtime-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DNEO_DISABLE_LD_GOLD:BOOL:BOOL='ON' \
        -DNEO_OCL_VERSION_MAJOR:STRING="${pkgver%%.*}" \
        -DNEO_OCL_VERSION_MINOR:STRING="$(cut -d . -f2 <<< "$pkgver")" \
        -DNEO_VERSION_BUILD:STRING="$(cut -d . -f3 <<< "$pkgver")" \
        -DSUPPORT_DG1:BOOL='ON' \
        -DSUPPORT_DG2:BOOL='ON' \
        -DKHRONOS_GL_HEADERS_DIR:PATH='/usr/include' \
        -DKHRONOS_HEADERS_DIR:PATH='/usr/include' \
        -DSKIP_UNIT_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "compute-runtime-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
    ln -s "$(find "${pkgdir}/usr/bin" -name 'ocloc-*' -exec basename {} \;)" "${pkgdir}/usr/bin/ocloc"
}
