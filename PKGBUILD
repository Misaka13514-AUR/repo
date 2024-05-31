# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
# Maintainer: sukanka

_pkgname=linuxqq
_base_pkgver=3.2.8-23873
_update_pkgver=${_base_pkgver}
_md5=96fbb21f
pkgname=linuxqq-nt-bwrap
pkgver="${_update_pkgver//-/_}"
pkgrel=5
pkgdesc="New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks"
arch=('x86_64' 'aarch64' 'loong64')
url='https://im.qq.com/linuxqq/index.shtml'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gtk3' 'gtk-update-icon-cache' 'libnotify' 'nss'
		'gnutls' 'bubblewrap' 'xdg-user-dirs' 'flatpak-xdg-utils' 'snapd-xdg-open-git'
		'libvips' 'openslide' 'autoconf'
		'libunwind'
		'iproute2'
		)
makedepends=('p7zip')
optdepends=('libappindicator-gtk3: 以显示托盘图标'
			'gjs: 提供 GNOME Wayland 下的截图支持'
			'slirp4netns: 固定 MAC 地址时需要'
			'socat: 固定 MAC 地址时需要'
			)
provides=('qq' 'linuxqq')
conflicts=('linuxqq')
options=('!emptydirs')
install="${pkgname}.install"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5}/linuxqq_${_base_pkgver}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5}/linuxqq_${_base_pkgver}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5}/linuxqq_${_base_pkgver}_loongarch64.deb")
source=('start.sh' 'start_normal.sh' 'start_mac_fix.sh' 'start_inner.sh' 'config.json' 'resolv.conf' 'xdg-open.sh')
sha256sums=('b75b1757ed2356c719607eb02a74d9e6cc24d98edb078f13b93b7e722e07e5e0'  # start.sh
			'de7b8528abb1308de44bc4c53296f01bd093ff680d5e7b2733a1931081fb9915'  # start_normal.sh
			'4c111efd4499c48eb79230cad6758498e0b461af14946030f67a424d1537067d'  # start_mac_fix.sh
			'3c78b576aa5d07e4cacde95d1088530503478bb0d43d19371c5da56f675d9861'  # start_inner.sh
            'bb2ec0f104da4da7422d9b0f51c71d0ab38ed2a21764a7a643ab42689e098e4b'  # config.json
            'cc002ee0eb2e8702c97d16f4ce628841cd5fe10195875a075432e92248741424'  # resolv.conf
            'f1c778b5a8b23bc77fd8e5e89056fea07309794c9a44ec38134a176cf1f7b675') # xdg-open.sh
sha256sums_x86_64=('d23e212d26cf80a40e3eab44499aa76586eade3fc260d1b9f171294fb507393f')
sha256sums_aarch64=('a92bfb1aa9d7be9f08161de4adc2652a17919f8b05e1caf8f9922d776cbc2548')
sha256sums_loong64=('56ec7abcaa5c96b8bd718096ed84f76b558ab815079e9e6e84f6bd37863b4ac6')

prepare() {
	local base_ver=${_base_pkgver}
	local cur_ver=${_update_pkgver:-${base_ver}}
	local build_ver=${cur_ver#*-}
	sed -i "s|__BASE_VER__|${base_ver}|g;s|__CURRENT_VER__|${cur_ver}|g;s|__BUILD_VER__|${build_ver}|g" config.json start.sh
}

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"

	chmod 755 "${pkgdir}/opt/QQ/resources/app"

	mv "${pkgdir}/opt/QQ/qq" "${pkgdir}/opt/QQ/electron"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm755 "xdg-open.sh" "${pkgdir}/opt/QQ/workarounds/xdg-open.sh"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"
	cp "${srcdir}/resolv.conf" "${pkgdir}/opt/QQ/workarounds/resolv.conf"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"

	# 删除原生库
	rm -f "${pkgdir}"/opt/QQ/resources/app/{libssh2.so.1,libunwind*,sharp-lib/libvips-cpp.so.42}

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start"*".sh" "${pkgdir}/opt/QQ/"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i "s|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|" "${pkgdir}/usr/share/applications/qq.desktop"

	# 这样就可以直接输入 qq 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
