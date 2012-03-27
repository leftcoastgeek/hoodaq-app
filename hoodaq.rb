#!/usr/bin/env ruby
$:<< '../lib' << 'lib'

# A simple dashboard for goliath
# See
#   examples/views              -- templates
#   examples/public             -- static files
#   examples/config/template.rb -- configuration
#
# The templating is based on, but not as fancy-pants as, Sinatra's. Notably,
# your template's extension must match the engine (foo.markdown, not foo.md)

require 'tilt'
require 'yajl/json_gem'
require 'goliath'
# require 'rack-pack'
# require 'jsmin'
require 'goliath/rack/templates'

class Template < Goliath::API
  include Goliath::Rack::Templates      # render templated files from ./views


  #static assests
  use(Rack::Static,                     # render static files from ./public
            :root => Goliath::Application.app_path("public"),
            :urls => ["/favicon.ico", '/css', '/js', '/images'])
    

  # routes 
  def response(env)
    case env['PATH_INFO']
    when '/'            then [200, {}, erb(:root)]
    when '/contact'     then [200, {}, erb(:conact)]
    when '/about'       then [200,  {},  erb(:about)]
    else                  
      raise Goliath::Validation::NotFoundError
    end
  end
end
