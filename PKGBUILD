# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=d031469630c70188c20598c0f3a3c3c46c6c7a14
_mozcver=2.26.4395.102
_utdicver=20210603
_fcitx5patchver=20210329
_fcitx5patchuserlink=28
_fcitx5patchlink=28063
_fcitx5iconver=20210520
_fcitx5iconuserlink=30
_fcitx5iconlink=30476
_buildtype=Release

pkgname='fcitx5-mozc-ut'
pkgver=${_mozcver}.${_utdicver}
pkgrel=1
pkgdesc='Mozc module for Fcitx5 bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/fcitx/mozc'
license=('custom')
depends=('fcitx5' 'mozc-ut-common')
makedepends=('clang' 'git' 'gtk2' 'ninja' 'pkgconf' 'python' 'python-six' 'qt5-base')
optdepends=('fcitx5-configtool')
conflicts=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-neologd-ut+ut2' 'fcitx-mozc-ut-unified' 'fcitx-mozc-ut-unified-full'
           'fcitx-mozc-ut' 'fcitx5-mozc' 'fcitx5-mozc-git')
provides=("fcitx5-mozc=${_mozcver}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}"
        "https://osdn.net/downloads/users/${_fcitx5patchuserlink}/${_fcitx5patchlink}/fcitx5-mozc-${_fcitx5patchver}.patch"
        "https://osdn.net/downloads/users/${_fcitx5iconuserlink}/${_fcitx5iconlink}/fcitx5-mozc-icons-${_fcitx5iconver}.tar.gz")
sha256sums=('SKIP'
            '1b8fe2f0cb1422c34602921f2cd0a85c4daa0b0ad473d1228f754d2a1505e77d'
            '4ebaf2d3ef8029a0fb40fce600471876d4bcd6492f99c083e5aa5b221614e4e4')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Fix for GCC11 compatibility
    # Based on original patch found at https://yanqiyu.fedorapeople.org/fcitx5-mozc/fix-build-gcc11.patch
    sed -i -e 's/#include <array>/#include <array>\n#include <limits>/' src/third_party/abseil-cpp/absl/synchronization/internal/graphcycles.cc

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi
    
    # Patch in the new Fcitx5 GYP target
    patch -Np1 -i ${srcdir}/fcitx5-mozc-${_fcitx5patchver}.patch
}

build() {
    cd ${pkgname}-git/src

    _targets='unix/fcitx5/fcitx5.gyp:fcitx5-mozc'

    GYP_DEFINES='document_dir=/usr/share/licenses/mozc'

    python build_mozc.py gyp --target_platform=Linux
    python build_mozc.py build -c ${_buildtype} ${_targets}
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                       ${pkgdir}/usr/share/licenses/mozc/fcitx5-mozc
    install -Dm644 data/installer/credits_en.html                   ${pkgdir}/usr/share/licenses/mozc/fcitx5-mozc-submodules
    
    install -Dm755 out_linux/${_buildtype}/fcitx5-mozc.so           ${pkgdir}/usr/lib/fcitx5/fcitx5-mozc.so
    install -Dm644 unix/fcitx5/mozc-addon.conf                      ${pkgdir}/usr/share/fcitx5/addon/mozc.conf
    install -Dm644 unix/fcitx5/mozc.conf                            ${pkgdir}/usr/share/fcitx5/inputmethod/mozc.conf

    for pofile in unix/fcitx5/po/*.po
    do
        filename=`basename ${pofile}`
        lang=${filename/.po/}
        mofile=${pofile/.po/.mo}
        msgfmt ${pofile} -o ${mofile}
        install -Dm644 ${mofile} ${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/fcitx5-mozc.mo
    done

    msgfmt --xml -d unix/fcitx5/po/ --template unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in -o unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml
    install -Dm644 unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml ${pkgdir}/usr/share/metainfo/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml

    cd ${srcdir}/fcitx5-mozc-icons-${_fcitx5iconver}/hicolor/

    install -Dm644 128x128/apps/fcitx-mozc.png                                 ${pkgdir}/usr/share/icons/hicolor/128x128/apps/fcitx-mozc.png
    install -Dm644 128x128/apps/org.fcitx.Fcitx5.fcitx-mozc.png                ${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.fcitx.Fcitx5.fcitx-mozc.png

    install -Dm644 32x32/apps/fcitx-mozc.png                                   ${pkgdir}/usr/share/icons/hicolor/32x32/apps/fcitx-mozc.png
    install -Dm644 32x32/apps/org.fcitx.Fcitx5.fcitx-mozc.png                  ${pkgdir}/usr/share/icons/hicolor/32x32/apps/org.fcitx.Fcitx5.fcitx-mozc.png

    install -Dm644 48x48/apps/fcitx-mozc-alpha-full.png                        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-alpha-full.png
    install -Dm644 48x48/apps/fcitx-mozc-alpha-half.png                        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-alpha-half.png
    install -Dm644 48x48/apps/fcitx-mozc-dictionary.png                        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-dictionary.png
    install -Dm644 48x48/apps/fcitx-mozc-direct.png                            ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-direct.png
    install -Dm644 48x48/apps/fcitx-mozc-hiragana.png                          ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-hiragana.png
    install -Dm644 48x48/apps/fcitx-mozc-katakana-full.png                     ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-katakana-full.png
    install -Dm644 48x48/apps/fcitx-mozc-katakana-half.png                     ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-katakana-half.png
    install -Dm644 48x48/apps/fcitx-mozc-properties.png                        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-properties.png
    install -Dm644 48x48/apps/fcitx-mozc-tool.png                              ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-tool.png

    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-full.png       ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-full.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-half.png       ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-half.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-dictionary.png       ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-dictionary.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-direct.png           ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-direct.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-hiragana.png         ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-hiragana.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-full.png    ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-full.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-half.png    ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-half.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-properties.png       ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-properties.png
    install -Dm644 48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-tool.png             ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-tool.png
}
