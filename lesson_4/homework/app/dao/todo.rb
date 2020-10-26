require_relative '../db/db'
require_relative './base'

module Dao
    class TodoDao < Dao::BaseDao
        def create(create_todo)
            @conn.exec(
                "INSERT INTO todos (title, done) VALUES ('#{create_todo.title}', '#{create_todo.done}');"
            )
        end

        def list_all
            @conn.exec("SELECT * FROM todos;")
        end

        def compute_where(params)
            len = params.length
            
            if len == 0
                return ""
            end
            
            result =
            params.reduce("WHERE "){ |prev, curr|
                postfix = ""
                
                (key, value) = curr
            
                if len > 1
                postfix = "AND"
                end
            
                puts "#{key} - #{value}"
            
                "#{prev}#{key} = #{value} #{postfix} "
            }

            result
        end          
    end
end