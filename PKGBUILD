# Maintainer: Kirukaze Chiyuki <me@chyk.ink>
# Maintainer: sukanka

_pkgname=linuxqq
_base_pkgver=3.2.7_240410
_update_pkgver=${_base_pkgver}
pkgname=linuxqq-nt-bwrap
pkgver="${_update_pkgver//-/_}"
pkgrel=1
pkgdesc="New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks"
arch=('x86_64' 'aarch64' 'loong64')
url='https://im.qq.com/linuxqq/index.shtml'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gtk3' 'gtk-update-icon-cache' 'libnotify' 'nss'
		'gnutls' 'bubblewrap' 'xdg-user-dirs' 'flatpak-xdg-utils' 'snapd-xdg-open-git'
		'libvips' 'openslide' 'autoconf'
		'libunwind'
		)
makedepends=('p7zip')
optdepends=('libappindicator-gtk3: 以显示托盘图标'
			'gjs: 提供 GNOME Wayland 下的截图支持')
provides=('qq' 'linuxqq')
conflicts=('linuxqq')
options=('!emptydirs')
install="${pkgname}.install"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${_base_pkgver}_amd64_01.deb")  # 底包
               #  "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/${pkgver//_/-}/${_update_pkgver_hash}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${_base_pkgver}_arm64_01.deb")  # 底包
                #  "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/${pkgver//_/-}/${_update_pkgver_hash}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${_base_pkgver}_loongarch64_01.deb")  # 底包
source=('start.sh' 'config.json' 'xdg-open.sh')
sha256sums=('01eb16521b9cfc993bbc91b3ebd8c8ab521e0cb63996a60fbcd1050b1184a676'
            'bb2ec0f104da4da7422d9b0f51c71d0ab38ed2a21764a7a643ab42689e098e4b'
            '99d7fe8dd193ebc06ba450a3e868d778e1dbe5938b726a67fadddc0c9ad9cab1')
sha256sums_x86_64=('d49bae49670ecc1382c77fb4048f47216ee70d3c3bf63bec498034eb99a1f9cc')
sha256sums_aarch64=('692f9b3ea97b007df35c0991db38081f58544144336810ddfb8ce65d87f9adc7')
sha256sums_loong64=('f9f499dc385078751663aafb4ae8e65b6cd285275ce471cb15f1216c8f9566d6')

prepare() {
	local base_ver=${_base_pkgver}
	local cur_ver=${_update_pkgver:-${base_ver}}
	local build_ver=${cur_ver#*-}
	sed -i "s|__BASE_VER__|${base_ver}|g;s|__CURRENT_VER__|${cur_ver}|g;s|__BUILD_VER__|${build_ver}|g" config.json start.sh
}

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"

	# 应用热更新
	# rm -rf "${pkgdir}/opt/QQ/resources/app"
	# 7z x "${pkgver//_/-}.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"

	chmod 755 "${pkgdir}/opt/QQ/resources/app"

	mv "${pkgdir}/opt/QQ/qq" "${pkgdir}/opt/QQ/electron"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm755 "xdg-open.sh" "${pkgdir}/opt/QQ/workarounds/xdg-open.sh"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"

	# 删除原生库
	rm -f "${pkgdir}"/opt/QQ/resources/app/{libssh2.so.1,libunwind*,sharp-lib/libvips-cpp.so.42}

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start.sh" "${pkgdir}/opt/QQ/start.sh"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i "s|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|" "${pkgdir}/usr/share/applications/qq.desktop"

	# 这样就可以直接输入 qq 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
