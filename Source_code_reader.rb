def read_and_print
  file = File.open(__FILE__, "r")
  file.readlines.each do |line|
    puts line
  end
  file.close
end

read_and_print
