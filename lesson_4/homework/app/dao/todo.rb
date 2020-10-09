require '../db/conn'

include ConnManager

module Dao
    class TodoDao

        private_class_method :new

        def initialize(conn)
            @conn = conn
        end

        def create(create_todo)
            @conn.exec(
                "INSERT INTO todos (title, done) VALUES ('#{create_todo.title}', '#{create_todo.done}');"
            )
        end

        def list_all
            data = @conn.exec(
                "SELECT * FROM todos;"
            )
        end

        def get_instance
            if !@instance
                @instance = TodoDao.new ConnManager.conn
            end
            @instance
        end
    end 
end