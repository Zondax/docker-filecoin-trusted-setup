FROM ubuntu:21.10 as builder

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt update && \
    apt install -y build-essential ocl-icd-opencl-dev && \
    apt install -y git ssh tmux rsync gpg curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

WORKDIR /filecoin

COPY deps/* .

ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone https://github.com/filecoin-project/rust-fil-proofs.git && \
    cd rust-fil-proofs && \
    git checkout a700f68c && \
    mv ../Cargo.lock . && \
    cargo build --release --bin phase2


FROM ubuntu:21.10 as final

RUN apt update &&     apt install -y ssh tmux rsync gpg openssh-client

WORKDIR /filecoin

COPY scripts .
COPY --from=builder /filecoin/target/release/phase2 /usr/local/bin

CMD [ "tail", "-f", "/dev/null" ]

