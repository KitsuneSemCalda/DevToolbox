FROM archlinux:latest

ARG PACMAN_PARALLEL_DOWNLOADS=25
ARG LUNARVIM_VERSION=1.2
ARG NEOVIM_VERSION=0.8

ARG USER
ARG USER_HOME

# Configure Pacman with Chaotic Aur
RUN pacman-key --init \
  && pacman-key --populate archlinux \
  && pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com \
  && pacman-key --lsign-key FBA220DFC880C036 \
  && pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm \
  && echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf 

# Configure Pacman configs
RUN sed 's/ParallelDownloads = \d+/ParallelDownloads = ${PACMAN_PARALLEL_DOWNLOADS}/g' -i /etc/pacman.conf \
  && sed 's/NoProgressBar/#NoProgressBar/g' -i /etc/pacman.conf\
  && pacman -Sy

# Install someone utilities used
RUN pacman -S --noconfirm \
  bat \
  exa \
  htop \
  tmux \
  neovim \
  sudo \
  base-devel \
  inetutils

# Configure the hostname to toolbox
ENV HOSTNAME toolbox

# Install someone utilities to development
RUN pacman -S --noconfirm \
  xmake \
  asdf-vm \
  xorriso \
  elixir \
  grub \
  mtools \
  qemu \
  clang \
  cargo \
  rust  \
  npm   \
  yarn  \
  nasm  \
  git   \
  git-lfs \
  glow \
  musl


# Configure sudo to run without password to group wheel
RUN sed -i 's/^# %wheel\s\+ALL=(ALL)\s\+ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
RUN echo -e "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN useradd -g wheel ${USER}
RUN mkdir ${USER_HOME}

RUN chown -R ${USER}:$(id -g $USER) ${USER_HOME}

USER ${USER}

# Install lunarvim
RUN LV_BRANCH="release-${LUNARVIM_VERSION}/neovim-${NEOVIM_VERSION}" \
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh) -y
