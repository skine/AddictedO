#!/bin/bash
if [ "x$1" == "x" ]; then
  echo "usage: update.sh theme-name"
  exit;
fi

# remove files
rm -f app/assets/stylesheets/application.css 
rm -f app/views/layouts/application.html.erb

# install bootswatch theme files
rails g bootswatch:install $1
rails g bootswatch:import $1

# update asset files
sed --in-place -e "s/\[theme-name\]/$1/g" app/assets/stylesheets/application.css.scss
sed --in-place -e "s/\[theme-name\]/$1/g" app/assets/javascripts/application.js
sed --in-place -e "s/\[theme-name\]/$1/g" app/views/layouts/application.html.haml

# set workaround 
echo "// workaround" >> app/assets/stylesheets/$1/variables.less
echo "@dropdown-caret-color: @gray-light;" >> app/assets/stylesheets/$1/variables.less
