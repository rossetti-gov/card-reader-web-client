# adapted from source: https://stackoverflow.com/a/45197288/670433

workers Integer(ENV['WEB_CONCURRENCY'] || 2)

threads_count = Integer(ENV['THREAD_COUNT'] || 5) # ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

rackup      DefaultRackup
port        ENV['PORT']     || 4567 # ENV.fetch("PORT") { 3000 }
environment ENV['RACK_ENV'] || 'development' # ENV.fetch("RAILS_ENV") { "development" }








# adapted from source: http://isselguberna.com/build-an-api-prototype-with-sinatra-in-6-steps/
 
#bind "unix:///var/www/user-service/tmp/sockets/puma.sock"
#pidfile "/var/www/user-service/tmp/pids/puma.pid"
#stdout_redirect "/var/www/user-service/log/puma.log"
