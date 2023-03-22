FROM archlinux:latest
ARG PACMAN_PARALLEL_DOWNLOADS=25
RUN pacman-key --init \
  && pacman-key --populate archlinux \
  && sed 's/ParallelDownloads = \d+/ParallelDownloads = ${PACMAN_PARALLEL_DOWNLOADS}/g' -i /etc/pacman.conf \
  && pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com \
  && pacman-key --lsign-key FBA220DFC880C036 \
  && pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm

RUN echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

ADD https://raw.githubusercontent.com/greyltc/docker-archlinux/master/get-new-mirrors.sh /usr/bin/get-new-mirrors
RUN chmod +x /usr/bin/get-new-mirrors

RUN pacman -Sy

RUN pacman -S --noconfirm \
  bat \
  exa \
  fd \
  duf \
  git \
  git-lfs \
  htop \
  tmux 

RUN pacman -S --noconfirm \
  clang \
  base-devel \
  xmake \
  grub \
  fuse-overlayfs \
  neovim \
  ripgrep 

