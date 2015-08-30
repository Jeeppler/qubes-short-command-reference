#! /usr/bin/env ruby

file = "#{ARGV[0]}"

text = File.open(file).read

#convert all windows "\r\n" or "\r" line endings to linux "\n" line endings
text.gsub!(/\r\n?/, "\n")

remove = FALSE

text.each_line do |line|
  if line.eql?("---\n") && !remove
    remove = TRUE
  elsif line.eql?("---\n") && remove
    remove = FALSE
  elsif line.eql?("Date  \n") && !remove
    remove = TRUE
  elsif line.eql?("SYNOPSIS\n") && remove
    remove = FALSE
    print "#{line}"
  elsif line.eql?("AUTHORS\n") && !remove
    remove = TRUE
  elsif !remove
    print "#{line}"
  end
end
