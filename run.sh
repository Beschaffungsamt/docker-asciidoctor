#!/bin/sh

for adoc in $(find . | grep main.adoc$); do

	echo "Document: $adoc"
	mkdir -p /target/$(dirname $adoc)
	asciidoctor $adoc -o /target/$(dirname $adoc)/index.html

done
