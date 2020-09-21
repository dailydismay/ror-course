def rand_number(quantity)
  i = 0

  while i < quantity do
    yield(i, rand(10))  
    i += 1
  end

end

rand_number(10) {|*args|  
  (index, num) = args
  puts "#{index}: #{num}"    
}