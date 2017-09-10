#!/bin/bash

pushd components/bootstrap-material-design
  npm install
  npm run build:js
  for i in blue indigo purple pink red orange yellow green teal cyan deep-purple light-blue light-green lime amber deep-orange brown grey; do
    sed -i -e "s@primary:.*@primary:\ \$${i}\,@g" scss/_custom.scss
    npm run build:css
    test -d ../../css/material-colors/${i} && rm -rf ../../css/material-colors/${i}
    mv dist/css ../../css/material-colors/${i}
  done
  sed -i -e "s@primary:.*@primary:\ \$indigo\,@g" scss/_custom.scss
popd
