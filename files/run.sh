#!/bin/sh

if [ -e .preasciidoctor.sh ]; then
	sh .preasciidoctor.sh
fi

params=""
if [ $diagram == "true" ]; then
	params="$params -r asciidoctor-diagram"
fi

for adoc in $(find . | grep main.adoc$); do

	echo "Document: $adoc"
	mkdir -p /target/$(dirname $adoc)
	asciidoctor $params $adoc -o /target/$(dirname $adoc)/index.html

	if [ $epub == "true" ]; then
		asciidoctor-epub3 $params $adoc -o /target/$(dirname $adoc)/document.epub
	fi

	if [ $pdf == "true" ]; then
		asciidoctor-pdf $params $adoc -o /target/$(dirname $adoc)/document.pdf
	fi

done

for assets in $(find . | grep .adocassets$); do

	echo "Assets: $(dirname $assets)"
	mkdir -p /target/$(dirname $assets)
	cp -r $(dirname $assets) /target/$(dirname $(dirname $assets))
done

if [ -e .postasciidoctor.sh ]; then
	sh .postasciidoctor.sh
fi
