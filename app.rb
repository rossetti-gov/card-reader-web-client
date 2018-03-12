require 'sinatra/base'
require 'openssl'
require 'pry'

class CardReaderWebClient < Sinatra::Base
  configure do
    enable :logging
  end

  get '/' do
    logger.info "---------------"
    logger.info "INDEX"
    logger.info "---------------"
    erb :index, locals: { title: "PIV/CAC Card Reader (Web Client)" }
  end

  get '/profile' do
    logger.info "---------------"
    logger.info "PROFILE"
    logger.info "---------------"
    #logger.info "REQUEST SECURE? #{request.secure?}"
    #logger.info "REQUEST ENV USER_AGENT: #{request.env["HTTP_USER_AGENT"]}"
    #logger.info "REQUEST ENV SSL_CLIENT_VERIFY: #{request.env["SSL_CLIENT_VERIFY"]}"
    #logger.info "REQUEST ENV CLIENT_VERIFY: #{request.env["HTTP_X_CLIENT_VERIFY"]}"
    #logger.info "REQUEST ENV CLIENT_SUB: #{request.env["HTTP_X_CLIENT_S_DN"]}"
    #logger.info "REQUEST ENV CLIENT_ISS: #{request.env["HTTP_X_CLIENT_I_DN"]}"
    #logger.info "REQUEST ENV CLIENT_SERIAL: #{request.env["HTTP_X_CLIENT_SERIAL"]}"
    #logger.info "REQUEST ENV SSL_CLIENT_CERT: #{request.env["HTTP_X_CLIENT_CERT"]}"
    #logger.info "REQUEST ENV CLIENT_FINGERPRINT: #{request.env["HTTP_X_CLIENT_FINGERPRINT"]}"
    #logger.info "HEADERS: #{headers}" #> {"Content-Type"=>nil}
    #logger.info "PARAMS: #{params}"

    #
    # LOCAL DEMONSTRATION/SIMULATION
    #

    begin
      reader = `opensc-tool -n`
      card = reader.strip #> "PIV-II card"

      raw_cert = `pkcs15-tool --read-certificate 1` #> "-----BEGIN CERTIFICATE-----\nABC...XYZ==\n-----END CERTIFICATE-----\n
      cert = OpenSSL::X509::Certificate.new(raw_cert)
      cn = cert.subject.to_a.find{|k,v| k=="CN"} #> ["CN", "TEST USER", 19]
      uid = cert.subject.to_a.find{|k,v| k=="UID"} #> ["UID", "01234567890123", 19]

      profile = {
        card: card,
        certs: [
          {
            serial: cert.serial.to_s,
            issuer: cert.issuer.to_a,
            issue_at: cert.not_before.to_s,
            expire_at: cert.not_after.to_s,
            subject: {
              name: cn[1], #> "TEST USER"
              uid: uid[1], #> 01234567890123
              email: "test.user@gmail.com"
            }
          }
        ]
      }

      logger.info profile

      erb :profile, locals: {title: "Profile Page", profile: profile}
    rescue => e
      logger.error "CARD-READING ERROR: #{e.class} - #{e.message}"
      redirect to('/') # TODO: session[:flash] = 'OOPS'
    end
  end
end

CardReaderWebClient.run!
