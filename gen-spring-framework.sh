#!/usr/bin/env sh

./utilsGenSpringDoc.sh spring-framework src/docs/asciidoc

DATE=`date '+%Y-%m-%d-%H'`
echo ${DATE}
# because the spring framework index just link, so all the sub pdf should copy separately. index just the list of doc

cp -rf ./asciidoctor-pdf-example/target/generated-docs/overview.pdf ./publish/spring-framework-overview-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/core.pdf ./publish/spring-framework-core-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/testing.pdf ./publish/spring-framework-testing-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/data-access.pdf ./publish/spring-framework-data-access-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/web.pdf ./publish/spring-framework-web-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/web-reactive.pdf ./publish/spring-framework-web-reactive-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/integration.pdf ./publish/spring-framework-integration-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/languages.pdf ./publish/spring-framework-languages-${DATE}.pdf
cp -rf ./asciidoctor-pdf-example/target/generated-docs/rsocket.pdf ./publish/spring-framework-rsocket-${DATE}.pdf
