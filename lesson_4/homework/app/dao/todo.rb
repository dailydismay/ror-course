require_relative '../db/db'

module Dao
    class BaseDao
        private_class_method :new

        def initialize(conn)
            @conn = conn
        end

        def self.get_instance
            unless @instance
                @instance = new Db::ConnManager.conn
            end
            @instance
        end
    end

    class TodoDao < BaseDao
        def create(create_todo)
            @conn.exec(
                "INSERT INTO todos (title, done) VALUES ('#{create_todo.title}', '#{create_todo.done}');"
            )
        end

        def list_all
            @conn.exec(
                            "SELECT * FROM todos;"
                        )
        end
    end
end