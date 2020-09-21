def rand_number(quantity)
  i = 0
  semaphore = Mutex.new

  while i < quantity do
    Thread.new {
      semaphore.synchronize {
        yield(i, rand(10))  
        i += 1
      }
    }
  end
end

rand_number(10) {|index, num|  
  puts "#{index}: #{num}"    
}
