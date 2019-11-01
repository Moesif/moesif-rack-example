
require 'json'
require "./config/application.rb"

use MoesifRack::MoesifMiddleware, MoesifOptions::moesif_options

class Application

    def call(env)
        status  = 200
        headers = { "Content-Type" => "application/json" }
        body    = [ { :hello => 'world' }.to_json ]

        [status, headers, body]
    end
end

run Application.new
