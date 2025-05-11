# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-legacy-bin
pkgver=24.35.30872.22
_gmmver=22.5.0
_gmmsover=12
_igcver=1.0.17537.20
_lzver="1.3.$(sed -E 's/([0-9]+\.){2}//' <<< "$pkgver")"
pkgrel=3
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (legacy platforms; pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    "intel-graphics-compiler-legacy-bin=${_igcver}")
optdepends=(
    'libva: for cl_intel_va_api_media_sharing'
    'libdrm: for cl_intel_va_api_media_sharing')
provides=(
    "intel-compute-runtime=${pkgver}"
    "intel-compute-runtime-legacy=${pkgver}"
    "intel-gmmlib=${_gmmver}"
    "intel-gmmlib-legacy=${_gmmver}"
    'level-zero-driver'
    'opencl-driver')
conflicts=(
    'intel-compute-runtime'
    'intel-gmmlib')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-opencl-icd-legacy1_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-level-zero-gpu-legacy1_${_lzver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm-dev_${_gmmver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm${_gmmsover}_${_gmmver}_amd64.deb"
        'LICENSE')
noextract=("intel-opencl-icd-legacy1_${pkgver}_amd64.deb"
           "intel-level-zero-gpu-legacy1_${_lzver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb")
sha256sums=('1ac4639c148ab6c9db6bc5a7733ca40bac3782cccc5b3da8e8cb7da8e8f20b1b'
            '54d42056c627dd36eaaf3dcfad5d80fb90e9c0d65e4a4d5ab8b0e8ed1277891b'
            'ca634ce51a9cac35010f363d34f84449ef1f20480ce6243920a80656754de932'
            'cc29d14df83cff1b3c6a66baa39257f0211b168ab43a99c2dc62a3734431bc23'
            '987a002c6c9eb75290d9937735641ef4f4b670591ee79e1ac8edebe16a81872e')

prepare() {
    mkdir -p {opencl,level-zero-gpu,gmmlib{,-dev}}-"$pkgver"
    bsdtar -xf "intel-opencl-icd-legacy1_${pkgver}_amd64.deb" -C "opencl-${pkgver}"
    bsdtar -xf "intel-level-zero-gpu-legacy1_${_lzver}_amd64.deb" -C "level-zero-gpu-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb" -C "gmmlib-dev-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb" -C "gmmlib-${pkgver}"
}

package() {
    bsdtar -xf "opencl-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "level-zero-gpu-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "gmmlib-dev-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.zst" -C "$pkgdir"
    mv "${pkgdir}/usr/lib/${CARCH}-linux-gnu"/* "${pkgdir}/usr/lib"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu_legacy1.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu_legacy1.so"
    ln -s "$(find "${pkgdir}"/usr/bin -name 'ocloc-*' -exec basename {} \;)" "${pkgdir}/usr/bin/ocloc"
    sed -i "s|/usr/lib/${CARCH}-linux-gnu|/usr/lib|" "${pkgdir}"/{etc/OpenCL/vendors/intel_legacy1.icd,usr/lib/pkgconfig/igdgmm.pc}
    rm "${pkgdir}/usr/share/doc"/{intel-{level-zero-gpu,opencl-icd}-legacy1,libigdgmm{-dev,"$_gmmsover"}}/{changelog.gz,copyright}
}
