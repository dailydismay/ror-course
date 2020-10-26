require 'sinatra/base'

module Controllers
  class BaseController < Sinatra::Base
    set :views, Proc.new { File.join(root, '../views') }
  end
end