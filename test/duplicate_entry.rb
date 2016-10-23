require 'block-is-array'

block_is_array %i(foo) do
  foo 123
  foo 123
end
