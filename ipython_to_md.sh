#!/bin/bash/

file_name=$1
echo ${file_name}
function converter() {
    jupyter nbconvert --to markdown --template basic --stdout --TemplateExporter.exclude_input_prompt=True `pwd`/_ipynbs/${file_name}.ipynb >> `pwd`/_posts/${file_name}.md
    echo "Success"
}
converter
