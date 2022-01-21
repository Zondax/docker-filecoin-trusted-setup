# Docker Filecoin Trusted Setup

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Pre-Release](https://github.com/zondax/docker-filecoin-trusted-setup/actions/workflows/pre-release.yaml/badge.svg)](https://github.com/zondax/docker-filecoin-trusted-setup/actions/workflows/pre-release.yaml)
[![Release](https://github.com/zondax/docker-filecoin-trusted-setup/actions/workflows/publish.yaml/badge.svg)](https://github.com/zondax/docker-filecoin-trusted-setup/actions/workflows/publish.yaml)

---

![zondax](docs/zondax.jpg)

_Please visit our website at [zondax.ch](zondax.ch)_

---
## Build&Run
### Build
To build the image, you can execute `make build`. The image will have the tag `zondax/filecoin-trusted-setup`

### Run
To run the container locally, you can execute `make run`. It can be run on a k8s cluster too. In order to do tath, you will find example files on k8s folder. 

**Tips**
- If you mount a volume on the container, you will keep files you don't want to lose, like PGP and SSH key (if you generated them inside the container)
- You can use `tmux` to avoid losing the current work if terminal gets closed.
- Using `tmux`, you can run multiple task at the same time. For contribution step, it would be very handy. Please check this [doc](https://tmuxcheatsheet.com) to know useful commands
--- 
## Ceremony

[Link](https://github.com/filecoin-project/phase2-attestations/tree/trusted-setup-2/ts2) to the current ceremony instructions. 

---

## Additional docs
### Zero-knowledge proofs
Please, read these two articles: [Article 1](https://medium.com/qed-it/diving-into-the-snarks-setup-phase-b7660242a0d7) and [Article 2](https://zkproof.org/2021/06/30/setup-ceremonies)
