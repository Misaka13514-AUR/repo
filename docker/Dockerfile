FROM archlinux:base

# Configure system for lilac
# https://lilac.readthedocs.io/en/latest/setup.html#installation
ARG MAINTAINER_GPG_FINGERPRINT=293B93D8A471059F85D716A65BA92099D9BE2DAA
COPY etc/ /etc/
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
    pacman-key --init && \
    pacman-key --populate && \
    pacman-key --recv-keys ${MAINTAINER_GPG_FINGERPRINT} && \
    pacman-key --lsign-key ${MAINTAINER_GPG_FINGERPRINT} && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm --needed base-devel && \
    pacman -S --noconfirm --needed nvchecker pyalpm python-awesomeversion python-lxml python-packaging python-jq python-toml python-aiohttp python-httpx git && \
    pacman -S --noconfirm --needed devtools lilac-git python-psycopg2 && \
    pacman -S --noconfirm --needed rclone fuse3 && \
    pacman -Scc --noconfirm && \
    rm -rf /etc/pacman.d/gnupg && \
    rm -rf /var/lib/pacman/sync && \
    rm -f /var/log/pacman.log && \
    rm -f /var/cache/ldconfig/aux-cache

# Remove unnecessary units
# https://github.com/alexheretic/aurto/blob/main/Dockerfile
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

# Configure user for lilac
# https://lilac.readthedocs.io/en/latest/setup.html#user-and-data
ARG UID=1001 \
    GID=954
RUN groupmod -g ${GID} pkg && \
    chgrp ${GID} /usr/bin/kill_children && \
    useradd -m -u ${UID} -g pkg -s /bin/bash lilac
COPY home/ /home/
RUN chown -R lilac:pkg /home/lilac && \
    chmod 700 /home/lilac/.ssh

COPY init.sh /
COPY group-log.sh /
COPY rclone-exclude.txt /
COPY repocleaner.py /
RUN chmod +x /init.sh && \
    chmod +x /group-log.sh && \
    chmod +x /repocleaner.py

VOLUME ["/tmp", "/run", "/run/lock"]
CMD [ "/lib/systemd/systemd", "log-level=info", "unit=sysinit.target" ]
