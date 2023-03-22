FROM archlinux:latest
ARG PACMAN_PARALLEL_DOWNLOADS=25
RUN pacman-key --init \
  && pacman-key --populate archlinux \
  && sed 's/ParallelDownloads = \d+/ParallelDownloads = ${PACMAN_PARALLEL_DOWNLOADS}/g' -i /etc/pacman.conf \
  && pacman -Syyuu --noconfirm

ADD https://raw.githubusercontent.com/greyltc/docker-archlinux/master/get-new-mirrors.sh /usr/bin/get-new-mirrors
RUN chmod +x /usr/bin/get-new-mirrors

RUN pacman -S --noconfirm \
  bat \
  exa \
  fd \
  duf \
  git \
  git-lfs \
  htop \
  tmux 

RUN useradd -m -G wheel kitsune
ADD ./subfiles/.bashrc /home/kitsune/.bashrc
ADD ./subfiles/.aliasrc /home/kitsune/.aliasrc
