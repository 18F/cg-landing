#!/bin/sh

set -e
set -x

# install dependencies
# https://github.com/ffi/ffi/issues/485#issuecomment-209778567
# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-179486583
apk add --update build-base libffi-dev libxml2-dev libxslt-dev
bundle config build.nokogiri --use-system-libraries
bundle

# build site
bundle exec jekyll build --trace

# copy files to output directory, so that they can be read by subsequent step
cp -R . ../cg-landing-compiled