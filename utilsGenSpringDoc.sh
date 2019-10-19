#!/usr/bin/env sh

# example: 
# spring-framework

[[ -z "$1" ]] && { echo "Please specify project name" ; exit 1; }
[[ -z "$2" ]] && { echo "Please specify asciidoc source relative path" ; exit 1; }

Project=$1
DocPath=$2

# 1. clone repo or update repo
./utilsCheckout.sh ${Project} https://github.com/spring-projects/${Project}.git
pwd

# 2. copy doc file to the workspace
#  such as: asciidoctor-pdf-example/src/docs/asciidoc

rm -rf ./asciidoctor-pdf-example/src/docs/asciidoc
rm -rf ./asciidoctor-epub-example/src/docs/asciidoc
# copy to workspace
cp -rf repos/${Project}/${DocPath} ./asciidoctor-epub-example/src/docs/
cp -rf repos/${Project}/${DocPath} ./asciidoctor-pdf-example/src/docs/

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

cp -rf ./asciidoctor-pdf-example/target/generated-docs/index.pdf ./publish/${Project}-${DATE}.pdf
cp -rf ./asciidoctor-epub-example/target/generated-docs/index.epub ./publish/${Project}-${DATE}.epub