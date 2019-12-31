
all: build

build:
	docker build -t moovement/postgis:11-2.5 .

update:
	echo "docker run --rm -v $$(pwd):/work -w /work buildpack-deps ./update.sh"

.PHONY: all build update
