guard :shell do
  watch(%r{^(.+)/lib/(.+)\.rb}) { |m| `ruby #{m[1]}/test/#{m[2]}_test.rb` }
  watch(%r{^(.+)/test/(.+)_test\.rb}) { |m| `ruby #{m[1]}/test/#{m[2]}_test.rb` }
end