require 'sinatra/base'
require 'openssl'
require 'pry'

require_relative "./models/profile"

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
      raw_cert = `pkcs15-tool --read-certificate 2` #> "-----BEGIN CERTIFICATE-----\nABC...XYZ==\n-----END CERTIFICATE-----\n
      cert = OpenSSL::X509::Certificate.new(raw_cert)
      profile = Profile.new(cert)
      logger.info profile
      erb :profile, locals: {title: "Profile Page", profile: profile}
    rescue => e
      logger.error "PROFILE ERROR: #{e.class} - #{e.message}"
      redirect to('/') # TODO: session[:flash] = 'OOPS'
    end
  end
end

CardReaderWebClient.run!
