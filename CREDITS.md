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
