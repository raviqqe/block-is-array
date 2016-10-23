require_relative 'class'



def block_is_array repeats, &block
  BlockIsArray.new(repeats, &block).to_array
end
