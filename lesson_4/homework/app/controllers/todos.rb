require 'sinatra/base'
require_relative '../dao/todo'

include Dao

module Controllers
    class TodosController < Sinatra::Base
        set :views, Proc.new { File.join(root, '../views') }


        get '/todos' do
            Dao::TodoDao.get_instance
            dao = Dao::TodoDao.get_instance
            @todos = dao.list_all
            erb :todos
        end
    end
end