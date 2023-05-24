-include .env.local
NAME = sphinx-builder
VERSION = 5.3.0

# sphinxdoc/sphinx, sphinxdoc/sphinx-latexpdf
BASEIMAGE = sphinxdoc/sphinx


all: build

# %: Makefile
# 	[ -d ./docs ] && cd ./docs && $(MAKE) $@
# 	@# $(MAKE) -C docs $@

## build: build sphinx-builder image with docker
build:
	docker build \
	  --build-arg BASE_IMAGE="$(BASEIMAGE)" \
	  --build-arg VERSION="$(VERSION)" \
	  --build-arg REPO_NAME="hedzr/sphinx-docker" \
	  --build-arg APT_MIRROR="$(APT_MIRROR)" \
	  -t $(NAME):latest -t $(NAME):$(VERSION) \
	  --progress=plain \
	  . \
	  2>&1 | tee build-$(NAME).log


.hello:
