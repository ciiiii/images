ARG GO_VERSION=1.25.3

FROM golang:${GO_VERSION}-trixie

ARG ROOTHOME=/Users/root

RUN mkdir -p $ROOTHOME
ENV HOME=$ROOTHOME

RUN apt-get update \
    && apt install --force-yes -y ca-certificates curl \
           build-essential gcc g++ \
           tzdata zip unzip vim wget \
           git openssh-client bash net-tools tmux sudo wget zsh \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# RUN go install github.com/go-delve/delve/cmd/dlv@latest

ENTRYPOINT [ "/bin/bash" ]
CMD ["-l"]