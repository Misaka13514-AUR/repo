# Contributor: Aleksander Mietinen <aleksander at mietinen dot net>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
_base=SecLists
pkgname=${_base,,}
pkgver=2025.1
pkgrel=1
pkgdesc="Collection of multiple types of lists used during security assessments"
arch=(any)
url="https://github.com/danielmiessler/${_base}"
license=(MIT)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9147222c99930ac0cd7ee93cd27ff5339c3a507c8cd289703adff7265fee493b9ca0e40a6509bde8b948af6eed12aaaf28a8453cfcf55655f7e2fc0c635bdbd1')

prepare() {
  cd ${_base}-${pkgver}
  find . -iname "rockyou*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
  cd ${_base}-${pkgver}

  # Install to /usr/share/seclists
  find . \( ! -iname "*.md" -a ! -iname ".git*" -a ! -name "LICENSE" \) -type f \
    -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

  # Install all *.md files to /usr/share/doc/seclists
  find . -iname "*.md" -type f \
    -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
