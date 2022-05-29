# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname='fcitx5-mozc-ut'
pkgver=2.28.4740.102
pkgrel=1
pkgdesc='Mozc module for Fcitx5'
arch=('x86_64')
url='https://github.com/fcitx/mozc'
license=('Apache' 'BSD' 'LGPL' 'custom')
depends=('fcitx5' 'mozc>=2.28.4740.102')
makedepends=('bazel' 'git' 'python' 'qt5-base')
optdepends=('fcitx5-configtool')
provides=('fcitx5-mozc=2.28.4740.102')
conflicts=('fcitx5-mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=73f289987769fe1dd381bf436b5888a2a663e276"
        "fcitx5.patch")
sha256sums=('SKIP'
            '6e02474ae4e5e453257edc04243ec23070efbf6015648e3c4fab44714d63e294')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    # Restore the workspace to its original state
    [[ -f BUILD.fcitx5.bazel ]] && rm BUILD.fcitx5.bazel
    [[ -d unix/fcitx5 ]] && rm -r unix/fcitx5
    git restore .

    # Patch in the out-of-source fcitx5 target (pulled from https://github.com/fcitx/mozc)
    patch -Np2 -i ${srcdir}/fcitx5.patch

    # Fix the Qt5 include path
    sed -i -e 's/x86_64-linux-gnu\/qt5/qt/' config.bzl

    # Temp fix for the Android NDK error
    sed -i -e 's/android_ndk_repository(name = "androidndk")/#android_ndk_repository(name = "androidndk")/' WORKSPACE.bazel
}

build() {
    cd ${pkgname}-git/src

    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build unix/fcitx5:fcitx5-mozc.so unix/icons --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/fcitx5-mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/fcitx5-mozc/credits_en.html

    install -Dm755 bazel-bin/unix/fcitx5/fcitx5-mozc.so         ${pkgdir}/usr/lib/fcitx5/fcitx5-mozc.so
    install -Dm644 unix/fcitx5/mozc-addon.conf                  ${pkgdir}/usr/share/fcitx5/addon/mozc.conf
    install -Dm644 unix/fcitx5/mozc.conf                        ${pkgdir}/usr/share/fcitx5/inputmethod/mozc.conf

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

    cd bazel-bin/unix

    unzip -o icons.zip

    install -Dm644 mozc.png                                     ${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.fcitx.Fcitx5.fcitx-mozc.png
    install -Dm644 alpha_full.svg                               ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-full.svg
    install -Dm644 alpha_half.svg                               ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-half.svg
    install -Dm644 direct.svg                                   ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-direct.svg
    install -Dm644 hiragana.svg                                 ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-hiragana.svg
    install -Dm644 katakana_full.svg                            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-full.svg
    install -Dm644 katakana_half.svg                            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-half.svg
    install -Dm644 outlined/dictionary.svg                      ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-dictionary.svg
    install -Dm644 outlined/properties.svg                      ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-properties.svg
    install -Dm644 outlined/tool.svg                            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-tool.svg

    ln -s org.fcitx.Fcitx5.fcitx-mozc.png                       ${pkgdir}/usr/share/icons/hicolor/128x128/apps/fcitx-mozc.png
    ln -s org.fcitx.Fcitx5.fcitx-mozc-alpha-full.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-alpha-full.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-alpha-half.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-alpha-half.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-direct.svg                ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-direct.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-hiragana.svg              ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-hiragana.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-katakana-full.svg         ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-katakana-full.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-katakana-half.svg         ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-katakana-half.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-dictionary.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-dictionary.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-properties.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-properties.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-tool.svg                  ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-tool.svg
}
