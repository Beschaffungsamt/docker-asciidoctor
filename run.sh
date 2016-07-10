#!/bin/sh

for adoc in $(find . | grep main.adoc$); do

	echo "Document: $adoc"
	mkdir -p /target/$(dirname $adoc)
	asciidoctor $adoc -o /target/$(dirname $adoc)/index.html
	asciidoctor-pdf $adoc -o /target/$(dirname $adoc)/document.pdf

done

for assets in $(find . | grep .adocassets$); do

	echo "Assets: $(dirname $assets)"
	mkdir -p /target/$(dirname $assets)
	cp -r $(dirname $assets) /target/$(dirname $(dirname $assets))
done
