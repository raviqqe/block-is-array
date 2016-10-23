require 'block-is-hash'

block_is_hash %i(foo) do
  foo 123
  foo 123
end
