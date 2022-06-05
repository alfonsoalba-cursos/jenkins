#!/usr/bin/env bash

slides_dir="slides/es/$1-$2"
images_dir="slides/images/es/$1"

[[ ! -d $slides_dir ]] && echo "Creating $slides_dir" &&  mkdir -p $slides_dir
[[ ! -d $images_dir ]] && echo "Creating $images_dir" &&  mkdir -p $images_dir

echo "Copiando imágenes"
cp -r $3/slides/images/* $images_dir
echo "Copiando diapositivas"
cp -r $3/slides/*.md $slides_dir
