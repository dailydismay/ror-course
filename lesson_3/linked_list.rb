class ListNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  include Enumerable
  
  attr_accessor :count

  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end
  
  def add(value)
    new_node = ListNode.new value
    
    if !@head
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end

    @count += 1
  end

  def is_empty
    @count == 0
  end

  def remove(data)
    curr = @head
    prev = nil

    while curr

      if curr.value == data
        if prev
          prev.next = curr.next

          if !curr.next
            @tail = prev
          end
        else
          @head = @head.next

          if !@head
            @tail = nil
          end

        end
      end
      
      prev = curr
      curr = curr.next
      @count -= 1
    end
  end

  def each(&block)
    curr = @head

    
    while curr
      block.call(curr.value)
      # yield(curr.value)
      curr = curr.next
    end

  end
end

l_l = LinkedList.new

l_l.add 5
l_l.add 6
l_l.add 7

l_l.remove 6

l_l.each {|val| puts val}

puts l_l.inject { |prev, cur| prev + cur }

