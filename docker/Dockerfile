FROM archlinux:base

# Copy the rootfs files
COPY rootfs/ /
RUN chmod +x /group-log.sh && \
    chmod +x /repocleaner.py && \
    chmod +x /init.sh

# Configure user for lilac
# https://lilac.readthedocs.io/en/latest/setup.html#user-and-data
ARG UID=1001 \
    GID=954
RUN groupadd -g ${GID} pkg && \
    useradd -m -u ${UID} -g pkg -s /bin/bash lilac
RUN chown -R lilac:pkg /home/lilac && \
    chmod 700 /home/lilac/.ssh

# Build and install lilac and dependencies
# https://lilac.readthedocs.io/en/latest/setup.html#installation
COPY pkgs/ /pkgs/
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
    chown -R lilac:pkg /pkgs && \
    pacman-key --init && \
    pacman-key --populate && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm --needed base-devel && \
    pacman -S --noconfirm --needed devtools python-psycopg2 && \
    pacman -S --noconfirm --needed nvchecker pyalpm python-awesomeversion python-lxml python-packaging python-jq python-toml python-aiohttp python-httpx git && \
    pacman -S --noconfirm --needed rclone fuse3 && \
    echo "lilac ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/lilac-build && \
    chmod 440 /etc/sudoers.d/lilac-build && \
    cd /pkgs/pid_children-git && sudo -u lilac makepkg --syncdeps --install --noconfirm --rmdeps --clean && \
    cd /pkgs/python-fluent.syntax && sudo -u lilac makepkg --syncdeps --install --noconfirm --rmdeps --clean && \
    cd /pkgs/python-fluent.runtime && sudo -u lilac makepkg --syncdeps --install --noconfirm --rmdeps --clean && \
    cd /pkgs/lilac-git && sudo -u lilac makepkg --syncdeps --install --noconfirm --rmdeps --clean && \
    rm -f /etc/sudoers.d/lilac-build && \
    cd / && \
    rm -rf /pkgs && \
    rm -rf /home/lilac/.cargo && \
    rm -rf /tmp/* && \
    chgrp ${GID} /usr/bin/kill_children && \
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

VOLUME ["/tmp", "/run", "/run/lock"]
CMD [ "/lib/systemd/systemd", "log-level=info", "unit=sysinit.target" ]
