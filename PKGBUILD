# Maintainer: Stefans Mezulis <stefans.mezulis@gmail.com>
pkgname=unison-backup
pkgver=0.1
pkgrel=1
epoch=0
pkgdesc="Use unison to sync local and remote files, Dropbox-style."
arch=('any')
url=""
license=('GPL')
groups=()
depends=('unison' 'perl')
makedepends=()
checkdepends=('google-cloud-sdk: connect to Google cloud VMs'
              'screen: for running a detatched unison instance')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("gcloud-unison-ssh"
        "unison-backup@.service"
        "update-debian-unison.sh"
        "README.pod")
noextract=()
md5sums=()
validpgpkeys=()

build() {
    local podflags=(
        '--utf8'
        '--center' 'Unison-backup documentation'
        '--release' "$pkgver")
    local ssh_script='gcloud-unison-ssh'

    pod2man "${podflags[@]}" --section 7 --name "$pkgname" \
        README.pod "$pkgname.7"
    pod2man "${podflags[@]}" --section 1 --name "$ssh_script" \
        "$ssh_script" "$ssh_script.1"
}

package() {
    install -D -m755 -t "$pkgdir/usr/bin" "gcloud-unison-ssh"
    install -D -m644 -t "$pkgdir/usr/share/man/man7/" "$pkgname.7"
    install -D -m644 -t "$pkgdir/usr/share/man/man1/" "gcloud-unison-ssh.1"
    install -D -m644 -t "$pkgdir/usr/lib/systemd/user" "unison-backup@.service"
    install -D -m644 -t "$pkgdir/usr/share/unison-backup" \
        "update-debian-unison.sh"
}
