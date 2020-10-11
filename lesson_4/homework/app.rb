require 'pg'
require 'sinatra'
require 'sinatra/base'
require 'byebug'
require './app/db/db'
require './app/controllers/todos'

include Db
include Controllers

Db::ConnManager.connect

class TodoApp < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, 'app/views') }

    use Controllers::TodosController

    get "/" do
        erb :index
    end

    configure :development do
        enable  :logging
    end


    # configure :development do
    #     enable :dump_errors, :raise_errors
    #     use ::BetterErrors::Middleware
    # end
end
