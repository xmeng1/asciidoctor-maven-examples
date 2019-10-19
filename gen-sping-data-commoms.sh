#!/usr/bin/env sh

# 1. clone repo or update repo
./utilsCheckout.sh spring-data-commons https://github.com/spring-projects/spring-data-commons.git
pwd

# 2. copy doc file to the workspace
#  such as: asciidoctor-pdf-example/src/docs/asciidoc

rm -rf ./asciidoctor-pdf-example/src/docs/asciidoc
rm -rf ./asciidoctor-epub-example/src/docs/asciidoc
# copy to workspace
cp -rf repos/spring-data-commons/src/main/asciidoc ./asciidoctor-epub-example/src/docs/
cp -rf repos/spring-data-commons/src/main/asciidoc ./asciidoctor-pdf-example/src/docs/

# 3. generate
cd asciidoctor-epub-example
mvn
cd ..
cd asciidoctor-pdf-example
mvn 
cd ..

# 4. copy the file to publish folder with version name
DATE=`date '+%Y-%m-%d-%H'`
echo ${DATE}

cp -rf ./asciidoctor-pdf-example/target/generated-docs/index.pdf ./publish/spring-data-commons-${DATE}.pdf
cp -rf ./asciidoctor-epub-example/target/generated-docs/index.epub ./publish/spring-data-commons-${DATE}.epub

cp -rf ./asciidoctor-pdf-example/target/generated-docs/index.pdf ./publish/spring-data-commons-2019-10-19-19.pdf