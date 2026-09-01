any:
	echo mjml-to-hml

run-dev:
	docker compose up dev

export userid=$$(id -u)

build-dev:
	docker compose build dev


mjml-to-html:
	echo input=$(input)
	@[ ! -f "$(input)" ] || ( echo set input= && exit 1 )
	docker compose run --rm --remove-orphans --workdir /src/mjml mjml mjml "$(input)" --config.allowIncludes
