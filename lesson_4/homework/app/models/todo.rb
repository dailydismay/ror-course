module Models
    class CreateTodo
        attr_accessor :title, :done

        def initialize(title = "", done = false)
            @title = title
            @done = done
        end
    end

    class Todo
        attr_accessor :id, :title, :done

        def initialize(args)
            @id = args[:id]
            @title = args[:title]
            @done = args[:done]
        end
    end
end