#!/bin/bash
set -e

MAINTAINER_GPG_FINGERPRINT=${MAINTAINER_GPG_FINGERPRINT:-"293B93D8A471059F85D716A65BA92099D9BE2DAA"}

pacman-key --init
pacman-key --populate
pacman-key --recv-keys ${MAINTAINER_GPG_FINGERPRINT}
pacman-key --lsign-key ${MAINTAINER_GPG_FINGERPRINT}

pacman -Syu --noconfirm
