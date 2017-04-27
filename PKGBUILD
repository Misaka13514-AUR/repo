# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgname=android-emulator
pkgver=26.0.2
pkgrel=1
pkgdesc='Google Android Emulator'
arch=('i686' 'x86_64')
url='https://developer.android.com/studio/releases/emulator.html'
license=('custom')
depends=('android-sdk')
install="${pkgname}.install"
source=('https://dl.google.com/android/repository/emulator-linux-3938741.zip'
        "${pkgname}.sh"
        "${pkgname}.csh")
sha1sums=('62153dd047f7efe2946dc4692d105340840808fd'
          '4537a7ce30bedf87cedafc2020822219ad58310d'
          '2fb371b5774b67143f0610dfbec4963a4e2f11cc')

package() {

  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"

  rm -rf emulator/lib{,64}/libstdc++

  if [[ "${CARCH}" = i686 ]]; then
    rm -rf emulator/lib64/
  fi

  install -d "${pkgdir}/opt/android-sdk/"
  cp -a emulator "${pkgdir}/opt/android-sdk/"

  # Fix broken permissions
  chmod -R o=g "${pkgdir}/opt/android-sdk/emulator"
  find "${pkgdir}/opt/android-sdk/emulator" -perm 744 -exec chmod 755 {} +
}

# getver: https://developer.android.com/studio/releases/emulator.html
# see https://dl.google.com/android/repository/repository2-1.xml for new versions
# vim:set ts=2 sw=2 et:
