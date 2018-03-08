require 'sinatra/base'
#require 'pry' unless ENV.fetch("RACK_ENV") == "production"

class CardReaderWebClient < Sinatra::Base
  configure do
    enable :logging
  end

  get '/' do
    erb :index, locals: { title: "PIV/CAC Card Reader (Web Client)" }
  end

  get '/profile' do
    logger.info "REQUEST SECURE? #{request.secure?}"
    logger.info "REQUEST ENV USER_AGENT: #{request.env["HTTP_USER_AGENT"]}"
    logger.info "REQUEST ENV SSL_CLIENT_VERIFY: #{request.env["SSL_CLIENT_VERIFY"]}"
    logger.info "REQUEST ENV CLIENT_VERIFY: #{request.env["HTTP_X_CLIENT_VERIFY"]}"
    logger.info "REQUEST ENV CLIENT_SUB: #{request.env["HTTP_X_CLIENT_S_DN"]}"
    logger.info "REQUEST ENV CLIENT_ISS: #{request.env["HTTP_X_CLIENT_I_DN"]}"
    logger.info "REQUEST ENV CLIENT_SERIAL: #{request.env["HTTP_X_CLIENT_SERIAL"]}"
    logger.info "REQUEST ENV CLIENT_FINGERPRINT: #{request.env["HTTP_X_CLIENT_FINGERPRINT"]}"
    logger.info "HEADERS: #{headers}" #> {"Content-Type"=>nil}
    logger.info "PARAMS: #{params}"

    certs = []
    name = "Test User"
    email = "abc123@gsa.gov"

    erb :profile, locals: {
      title: "Profile Page",
      user: { certs: certs, name: name, email: email }
    }
  end
end

CardReaderWebClient.run!
