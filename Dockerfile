FROM ubuntu:21.10 as builder

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt update && \
    apt install -y build-essential ocl-icd-opencl-dev && \
    apt install -y git ssh tmux rsync gpg curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

WORKDIR /filecoin

ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone  https://github.com/filecoin-project/filecoin-phase2.git && \
    cd filecoin-phase2 && \
    git checkout empty-sector-update && \
    cargo build --release --bins


FROM ubuntu:21.10 as final

RUN apt update &&     apt install -y ssh tmux rsync gpg openssh-client

WORKDIR /filecoin

COPY scripts ./utils
RUN mkdir -p ./ceremony

COPY --from=builder /filecoin/filecoin-phase2/target/release/filecoin-phase2 /usr/local/bin/phase2

CMD [ "tail", "-f", "/dev/null" ]

