# Credits, Notes, and Reference

## Server Headers and Config

  + [NGINX + PHP Demo](https://gist.github.com/brodygov/6fadd5eb0b1ecc90f27824197b31b80f#file-nginx-default-conf)
  + [NGINX `http_ssl_module`](http://nginx.org/en/docs/http/ngx_http_ssl_module.html)
  + Relevant NGINX `http_ssl_module` methods and corresponding headers:
    + `ssl_client_verify`, `X-Client-Verify`, `SSL_CLIENT_VERIFY`
    + `ssl_client_s_dn`, `X-Client-S-Dn`, Subject
    + `ssl_client_i_dn`, `X-Client-I-Dn`, Issuer
    + `ssl_client_serial`, `X-Client-Serial`, Serial Number
    + `ssl_client_fingerprint`, `X-Client-Fingerprint`
    + `SSL_CLIENT_CERT`
    + `ssl_client_raw_cert`
  + [SSL Script Rails](https://github.com/brockgr/rack-handler-apache/blob/master/examples/ssl-script-rails), `OpenSSL::SSL::VERIFY_NONE`
  + [Mini tutorial for configuring client-side SSL certificates](https://gist.github.com/mtigas/952344)

## Smart Cards

  + [A Case for Native Smart Card Support in Browsers](https://techblog.bozho.net/case-native-smart-card-support-browsers/) - "Now, signature is one thing, identification (TLS client auth) is another. Allegedly, things should work there – PKCS#11 is a standard that should allow TLS client auth to happen with a smart card. Reality is – it doesn’t. You often need a vendor-specific PKCS#11 library. OpenSC, which is a cool tool that works with many smart cards, only works with Firefox and Safari"


## OpenSC

  + [OpenSC - Using Smart Cards with Applications](https://github.com/OpenSC/OpenSC/wiki/Using-smart-cards-with-applications)
  + [Installing OpenSC PKCS#11 Module in Firefox, Step by Step](https://github.com/OpenSC/OpenSC/wiki/Installing-OpenSC-PKCS%2311-Module-in-Firefox%2C-Step-by-Step)

Install opensc:

```sh
brew install opensc
```

Detect if a card-reader is present:

```sh
opensc-tool -n
```

```sh
pkcs15-tool --list-public-keys
```

```sh
pkcs15-tool --read-public-key 1
```

```sh
pkcs15-tool --read-certificate 1 | openssl x509 -noout -text
```

## OpenSSL

  + [Ruby `OpenSSL::X509::Certificate`](https://ruby-doc.org/stdlib-1.9.3/libdoc/openssl/rdoc/OpenSSL/X509/Certificate.html)

## Web E-Id

  + [Web E-Id](https://hwcrypto.github.io/)
  + [`hwcrypto.js`](https://github.com/hwcrypto/hwcrypto.js)
  + [`hwcrypto.js` API](https://github.com/hwcrypto/hwcrypto.js/wiki/API)
  + [`hwcrypto.js` Demo](https://hwcrypto.github.io/demo/)
  + [Web eID Browser Extension](https://github.com/web-eid/web-eid-extension)
  + [`web-eid.js`](https://github.com/web-eid/web-eid.js)

## Web Crypto API

  + [Web Authentication W3 Working Draft](https://www.w3.org/TR/webauthn/)
  + [Web Cryptography API W3 Recommendation](https://www.w3.org/TR/WebCryptoAPI/)
  + [Browser Support for Web Crypto](https://caniuse.com/#feat=cryptography)
  + [Security Analysis of the W3C Web Cryptography API (NIST 2016)](https://csrc.nist.gov/csrc/media/events/ssr-2016-security-standardisation-research/documents/presentation-mon-halpin.pdf)
  + [What’s wrong with in-browser cryptography? (2013)](https://tonyarcieri.com/whats-wrong-with-webcrypto) - "If ample precautions are taken (which includes a large laundry list of things like TLS, CSP, CORS, proper HTTP headers, JS strict mode, and more), this can allow for the successful development of cryptographic applications"
  + [Web Cryptography API Examples](https://github.com/diafygi/webcrypto-examples)

## Cloudflare CFFSL

  + [Introducing TLS with Client Authentication](https://blog.cloudflare.com/introducing-tls-client-auth/)
  + [`cfssl`](https://github.com/cloudflare/cfssl) - "command line tool and an HTTP API server for signing, verifying, and bundling TLS certificates"

## Max.Gov

  + [MAX.gov Login](https://login.max.gov/cas/login) - "Users with a working PIV or CAC card can associate their card with an existing MAX account. This provides 2-factor authentication that is more secure than a User ID and Password for accessing sensitive-but-unclassified (SBU) content setup to require MAX Secure+. To associate your PIV or CAC card you will need your MAX UserID and a working password. (Thereafter you will be able to login to MAX using just your PIV or CAC card and its built-in PIN number.)"

## Sinatra

  + [Sinatra Docs](http://sinatrarb.com/intro.html)
  + [Identity OIDC Sinatra Client](https://github.com/18F/identity-openidconnect-sinatra/blob/master/app.rb)

## NGINX

  + [NGINX Beginner's Guide](http://nginx.org/en/docs/beginners_guide.html)

```sh
brew install nginx
```

    ######################################################################## 100.0%
    ==> Pouring nginx-1.13.9.sierra.bottle.tar.gz
    ==> Caveats
    Docroot is: /usr/local/var/www

    The default port has been set in /usr/local/etc/nginx/nginx.conf to 8080 so that
    nginx can run without sudo.

    nginx will load all files in /usr/local/etc/nginx/servers/.

    To have launchd start nginx now and restart at login:
      brew services start nginx
    Or, if you don't want/need a background service you can just run:
      nginx
    ==> Summary
    🍺  /usr/local/Cellar/nginx/1.13.9: 23 files, 1.4MB


### Running NGINX Locally

  + Installing and configuring NGINX on Mac OS w/ homebrew:
    + [circa 2012](http://learnaholic.me/2012/10/10/installing-nginx-in-mac-os-x-mountain-lion/)
    + [circa 2015](https://medium.com/@ThomasTan/installing-nginx-in-mac-os-x-maverick-with-homebrew-d8867b7e8a5a)

Inspect the configuration file:

```sh
atom /usr/local/etc/nginx/nginx.conf
```

Start the server to test the installation:

```sh
brew services start nginx # then visit http://localhost:8080/ to find a welcome message
```

Stop the server, then make adjustments to the config file:

```sh
brew services stop nginx
```















## NGINX And Ruby/Rack

  + [How HTTP Headers Get Passed from NGINX to Ruby App](http://blog.honeybadger.io/how-cookies-and-other-http-headers-get-passed-from-nginx-to-rack-and-into-rails/)
  + [How to Deploy Rack App w/ NGINX](https://stackoverflow.com/questions/13030149/how-to-deploy-ruby-rack-app-with-nginx) - Passenger, Thin, Unicorn, etc.
  + [How to make Sinatra work over HTTPS / SSL](https://stackoverflow.com/questions/3696558/how-to-make-sinatra-work-over-https-ssl)

### Passenger

  + [Deploying a Ruby application on Passenger + Nginx](https://www.phusionpassenger.com/library/deploy/nginx/deploy/ruby/)
  + [Quickstart: Ruby + Phusion Passenger](https://www.phusionpassenger.com/library/walkthroughs/start/ruby.html)
  + [Passenger Ruby Bundle Support](https://www.phusionpassenger.com/library/indepth/ruby/bundler.html)
  + [Ruby debugging console on Passenger + Nginx](https://www.phusionpassenger.com/library/admin/nginx/debugging_console/ruby/)

### Thin

  + [Thin](https://github.com/macournoyer/thin) (identity-idp uses this in development)
  + [Can I enable SSL in Sinatra with Thin?](https://stackoverflow.com/questions/11405161/can-i-enable-ssl-in-sinatra-with-thin)
  + [Deploying Sinatra on DigitalOcean with Nginx and Thin](https://michaelcarrano.com/blog/deploying-sinatra-app-on-digitalocean-with-nginx-and-thin)

### Unicorn

  + [Sinatra Proxied to Unicorn](http://recipes.sinatrarb.com/p/deployment/nginx_proxied_to_unicorn)

### Puma

  + [Puma](https://github.com/puma/puma/)
  + [Puma with Sinatra](https://github.com/puma/puma#sinatra)
  + [Build API Prototype in Sinatra in 6 Steps](http://isselguberna.com/build-an-api-prototype-with-sinatra-in-6-steps/)

### Rack

+ [Web Server vs. App Server](https://www.justinweiss.com/articles/a-web-server-vs-an-app-server/)















## Cloud.gov

  + [Setting up cloud.gov](https://cloud.gov/docs/getting-started/setup/#set-up-the-command-line)
  + [Your first cloud.gov deploy](https://cloud.gov/docs/getting-started/your-first-deploy/)
  + [`VCAP_SERVICES`](https://docs.run.pivotal.io/devguide/deploy-apps/environment-variable.html#VCAP-SERVICES)
  + [Deploying to Cloud.gov](https://cloud.gov/docs/apps/deployment/)

[Installing Cloud Foundry](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html#pkg-mac):

```sh
brew tap cloudfoundry/tap
brew install cf-cli
```

Logging in:

```sh
cf login -a api.fr.cloud.gov --sso
```

Verify target space:

```sh
cf target
```

Deploy from any branch (git-unaware):

```sh
cf push card-reader-web-client # then visit https://card-reader-web-client.app.cloud.gov/
```

Checking logs:

```sh
cf logs card-reader-web-client --recent
```

### Cloud Foundry

+ [Cloud Foundry Nginx Buildpack](https://github.com/cloudfoundry-community/nginx-buildpack) (deprecated)
+ [Cloud Foundry Staticile Buildpack](https://github.com/cloudfoundry/staticfile-buildpack) (supersedes Nginx Buildpack)
+ [Staticfile Docs](https://docs.cloudfoundry.org/buildpacks/staticfile/index.html) - will detect an `nginx.conf` in the application's root directory

## Assets

  + [Card Icon Source](https://www.flaticon.com/free-icon/id-card_223436)

<div>Icons made by <a href="https://www.flaticon.com/authors/kirill-kazachek" title="Kirill Kazachek">Kirill Kazachek</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
