# --------- INSTRUCTIONS ---------
#Each participant must sign their contribution using GPG. Each participant's signing public-key must be stored in a
# publicly accessible location, for example using a GitHub Gist.
#
#Each participant may use either a preexisting GPG signing keypair, for example a keypair that was generated
# during Filecoin's Mainnet trusted-setup, or may generate a new signing keypair
# (which should be used exclusively for Filecoin's trusted-setup).
#
#If a participant does not already have a GPG signing keypair, one can be generated using
# the following command; note that the participant should update the participant_name='...' variable
# to contain their own name, handle, or pseudonym
#
#
# Link: https://github.com/filecoin-project/phase2-attestations/tree/trusted-setup-2/ts2#02-publish-gpg-public-key

# ---------------------------

participant_name=$1; \
      mkdir keyring \
      && gpg --homedir keyring --pinentry-mode loopback --passphrase '' --quick-generate-key "Filecoin trusted-setup esu ${participant_name}" ed25519 default none \
      && gpg --homedir keyring --armor --export > sig_pubkey.asc \
      && gpg --homedir keyring --armor --export-secret-key > sig_seckey.asc \
      && rm -rf keyring
