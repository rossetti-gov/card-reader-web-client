# Smart Card Reader (Web Client)

An investigation into TLS Client Auth.

## Installation

Requires Ruby (version ~> 2.3.5), Bundler (version ~> 1.16.1), and NGINX (installed via `brew install nginx`).

Install source code:

```sh
git clone git@github.com:rossetti-gov/card-reader-web-client.git
cd card-reader-web-client/
```

Install package dependencies:

```sh
bundle install
```

## Usage

Run in development:

```sh
bundle exec unicorn -c unicorn.rb -E development -D # then view in browser at localhost:4567
```
