# Pipely::Generators

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'pipely-generators'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipely-generators

## Usage

To create a minimum viable pipeline, run:

    $ pipely-generate test_pipeline

This will generate a pipeline with a dummy configuration using the config.yml.tt file found in this repository's templates/config directory.

To use your own configuration for generating pipelines, copy that file into ~/.pipely-generate/config/config.yml.tt and update it to contain your site-specific settings before generating the pipeline.

## Confirmation

To ensure the pipeline was generated properly, run:

    $ bundle install
    $ bundle exec rake graph:open

And you should see an image with three ShellCommandActivity nodes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
