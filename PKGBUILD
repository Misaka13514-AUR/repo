# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=e7a97d0eea658a5cf7cd800eea75c57b70a70a7c
_major=2
_minor=26
_build=4206
_revision=102
_mozcver=${_major}.${_minor}.${_build}.${_revision}
_utdicdate=20201129
_utdicrel=1
_bldtype=Release

pkgname='fcitx5-mozc-ut'
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1
pkgdesc='Mozc module for Fcitx5 bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/fcitx/mozc'
license=('custom')
depends=('fcitx5' 'mozc-ut-common')
makedepends=('clang' 'git' 'gtk2' 'ninja' 'pkgconf' 'python' 'python-six' 'qt5-base')
conflicts=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-neologd-ut+ut2' 'fcitx-mozc-ut-unified' 'fcitx-mozc-ut-unified-full'
           'fcitx-mozc-ut' 'fcitx5-mozc' 'fcitx5-mozc-git')
provides=("fcitx5-mozc=${_mozcver}")
source=("${pkgname}-git::git+https://github.com/fcitx/mozc.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi
    
    # Avoid more build errors (remove old Fcitx GYP target)
    rm -r src/unix/fcitx
}

build() {
    cd ${pkgname}-git/src

    _targets='unix/fcitx5/fcitx5.gyp:fcitx5-mozc'

    GYP_DEFINES='document_dir=/usr/share/licenses/mozc'

    python build_mozc.py gyp --target_platform=Linux
    python build_mozc.py build -c ${_bldtype} ${_targets}
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                           ${pkgdir}/usr/share/licenses/mozc/fcitx5-mozc
    install -Dm644 data/installer/credits_en.html                       ${pkgdir}/usr/share/licenses/mozc/fcitx5-mozc-submodules
    
    install -Dm755 out_linux/${_bldtype}/fcitx5-mozc.so                 ${pkgdir}/usr/lib/fcitx5/fcitx5-mozc.so
    install -Dm644 unix/fcitx5/mozc-addon.conf                          ${pkgdir}/usr/share/fcitx5/addon/mozc.conf
    install -Dm644 unix/fcitx5/mozc.conf                                ${pkgdir}/usr/share/fcitx5/inputmethod/mozc.conf

    for pofile in unix/fcitx5/po/*.po
    do
        filename=`basename ${pofile}`
        lang=${filename/.po/}
        mofile=${pofile/.po/.mo}
        msgfmt ${pofile} -o ${mofile}
        install -Dm644 ${mofile} ${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/fcitx5-mozc.mo
    done
    
    install -Dm644 data/images/product_icon_32bpp-128.png               ${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.fcitx.Fcitx5.fcitx-mozc.png
    install -Dm644 data/images/unix/ime_product_icon_opensource-32.png  ${pkgdir}/usr/share/icons/hicolor/32x32/apps/org.fcitx.Fcitx5.fcitx-mozc.png
    install -Dm644 ../scripts/icons/ui-alpha_full.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-full.png
    install -Dm644 ../scripts/icons/ui-alpha_half.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-half.png
    install -Dm644 ../scripts/icons/ui-direct.png                       ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-direct.png
    install -Dm644 ../scripts/icons/ui-hiragana.png                     ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-hiragana.png
    install -Dm644 ../scripts/icons/ui-katakana_full.png                ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-full.png
    install -Dm644 ../scripts/icons/ui-katakana_half.png                ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-half.png
    install -Dm644 ../scripts/icons/ui-dictionary.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-dictionary.png
    install -Dm644 ../scripts/icons/ui-properties.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-properties.png
    install -Dm644 ../scripts/icons/ui-tool.png                         ${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.fcitx.Fcitx5.fcitx-mozc-tool.png

    ln -sf org.fcitx.Fcitx5.fcitx-mozc.png                              ${pkgdir}/usr/share/icons/hicolor/128x128/apps/fcitx-mozc.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-alpha-full.png                   ${pkgdir}/usr/share/icons/hicolor/32x32/apps/fcitx-mozc-alpha-full.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-alpha-half.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-alpha-half.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-direct.png                       ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-direct.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-hiragana.png                     ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-hiragana.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-katakana-full.png                ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-katakana-full.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-katakana-half.png                ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-katakana-half.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-dictionary.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-dictionary.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-properties.png                   ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-properties.png
    ln -sf org.fcitx.Fcitx5.fcitx-mozc-tool.png                         ${pkgdir}/usr/share/icons/hicolor/48x48/apps/fcitx-mozc-tool.png
    
    msgfmt --xml -d unix/fcitx5/po/ --template unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in -o unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml
    install -Dm644 unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml ${pkgdir}/usr/share/metainfo/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml
}
