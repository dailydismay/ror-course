def rand_number(quantity)
  i = 0
  semaphore = Mutex.new

  while i < quantity do
    Thread.new {
      semaphore.synchronize {
        i += 1
        yield(i, rand(10))  
      }
    }
  end
end

rand_number(10) {|index, num|  
  puts "#{index}: #{num}"    
}
