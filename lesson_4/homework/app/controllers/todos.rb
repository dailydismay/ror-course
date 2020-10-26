require 'sinatra/base'
require_relative '../dao/todo'
require_relative './base'

include Controllers
include Dao

module Controllers
    class TodosController < Controllers::BaseController
        set :views, Proc.new { File.join(root, '../views') }

        get '/todos' do
            dao = Dao::TodoDao.get_instance
            @todos = dao.list_all
            erb :todos
        end
    end
end