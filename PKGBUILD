# Contributor: Aleksander Mietinen <aleksander at mietinen dot net>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
_base=SecLists
pkgname=${_base,,}
pkgver=2025.2
pkgrel=1
pkgdesc="Collection of multiple types of lists used during security assessments"
arch=(any)
url="https://github.com/danielmiessler/${_base}"
license=(MIT)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('927bb2c024d3d08f38a3eadfeff3bbee9e5da69f2c52d79dc8187569783620c28ec85a8844314956fbe5b90c7f40f6f21b0265492242fe87ee71f3d8dcd0e50e')

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
