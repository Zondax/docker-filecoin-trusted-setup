build:
	docker build -f Dockerfile -t zondax/filecoin-trusted-setup .

run:
	docker run zondax/filecoin-trusted-setup
