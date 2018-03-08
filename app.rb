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








  # adapted from source: https://stackoverflow.com/a/13426852/670433
  def self.run!
    puts "RUNNING HERE"
    #logger.info "RUNNING HERE"

    rack_handler_options = {
      Port: 4567
    }

    ssl_options = {
      :private_key_file => '/path/to/foo.key',
      :cert_chain_file => '/path/to/bar.crt',
      :verify_peer => false,
    }

    # see: http://test.calder.org/gems/doc/rack-1.4.1/rdoc/Rack/Handler/Thin.html
    Rack::Handler::Thin.run(self, rack_handler_options) do |server|
      server.ssl = true
      server.ssl_options = ssl_options
    end
  end
end

CardReaderWebClient.run!


=begin
class Server < ::Rack::Server
        def default_options
            super.merge({
                :Port => 3001,
                :environment => (ENV['RAILS_ENV'] || "development").dup,
                :daemonize => false,
                :debugger => false,
                :config => File.expand_path("config.ru"),
                :SSLEnable => true,
                :SSLVerifyClient => OpenSSL::SSL::VERIFY_NONE,
                :SSLPrivateKeyFile => "#{Rails.root}/ssl/server.key",
                :SSLCertificateFile => "#{Rails.root}/ssl/server.crt",
                :SSLCertName => [["CN", WEBrick::Utils::getservername]]
            })
        end
    end
=end
