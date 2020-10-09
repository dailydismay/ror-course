require 'sinatra/base'
require '../dao/todo'

include Dao

module Controllers
    class TodosController::base
        get '/todos' do

            dao = TodoDao.get_instance

            @todos = dao.list_all

            erb :todos
        end
    end
end