mjml-to-html:
	echo input=$(input)
	@[ ! -f "$(input)" ] || ( echo set input= && exit 1 )
	docker compose run --rm --remove-orphans --workdir /src/mjml mjml mjml "$(input)" --config.allowIncludes
