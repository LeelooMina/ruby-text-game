def slow_text(sleep_time = 0.05)
  yield.each_char { |c| putc c; $stdout.flush; sleep sleep_time }
  puts
end
