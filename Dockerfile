FROM archlinux:base

RUN pacman -Syyu --noconfirm

RUN pacman -S --noconfirm base-devel curl git wget zsh zsh-completions tmux vim neovim ruby fasd

RUN eval "$(fasd --init auto)"

RUN gem install neovim

RUN curl -L http://install.ohmyz.sh | sh

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

RUN . ~/.asdf/asdf.sh && \
    . ~/.asdf/completions/asdf.bash && \
    asdf plugin-add python && \
    asdf install python 3.9.1 && \
    asdf global python 3.9.1 && \
    asdf reshim python && \
    pip3 install neovim

RUN . ~/.asdf/asdf.sh && \
    . ~/.asdf/completions/asdf.bash && \
    asdf plugin-add direnv && \
    asdf install direnv 2.27.0 && \
    asdf global direnv 2.27.0 && \
    asdf reshim direnv

RUN . ~/.asdf/asdf.sh && \
    . ~/.asdf/completions/asdf.bash && \
    asdf plugin-add golang && \
    asdf install golang 1.9.3 && \
    asdf global golang 1.9.3 && \
    asdf reshim golang

RUN mkdir /dotfiles

WORKDIR /dotfiles

COPY . .

RUN bash installer.sh
