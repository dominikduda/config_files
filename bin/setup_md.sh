#!/bin/bash

function setup {
  # 'a' stangs for after line, -i for editing file in place
  # /string_to_replace/<options> desired_multiline_string filename
  sed -i '/  class Application < Rails::Application/a \
      config.middleware.insert_before 0, "Rack::Cors" do \
        allow do \
          origins "*" \
          resource "*", headers: :any, methods: [:get, :post, :options] \
        end \
      end' config/application.rb
  printf "gem 'rack-cors', require: 'rack/cors'" >> Gemfile
  bundle
  touch ran_scripts
  printf "setup_md.sh -> true" >> ran_scripts
}

if grep "setup_md.sh -> true" ran_scripts; then
  echo 'The script was already executed!'
else
  setup
fi
