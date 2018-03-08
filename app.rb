require 'sinatra/base'
require 'pry'

class CardReaderWebClient < Sinatra::Base
  get '/' do
    #logger.info "SECURE? #{request.secure?}"
    puts "SECURE? #{request.secure?}"
    erb :index, locals: { title: "PIV/CAC Card Reader (Web Client)" }
  end

  get '/profile' do
    #  logger.info "HEADERS: #{headers}"
    #  #logger.info headers["Content-Type"]
    #  #logger.info "PARAMS: #{params}"
    #  #logger.info request.env["HTTP_USER_AGENT"]
    #  logger.info request.env["SSL_CLIENT_VERIFY"]
    #  logger.info request.env["HTTP_X_CLIENT_VERIFY"]
    #  logger.info request.env["HTTP_X_CLIENT_S_DN"]
    #  logger.info request.env["HTTP_X_CLIENT_I_DN"]
    #  logger.info request.env["HTTP_X_CLIENT_SERIAL"]
    #  logger.info request.env["HTTP_X_CLIENT_FINGERPRINT"]

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
