require_relative 'class'



def block_is_array &block
  BlockIsArray.new(&block).to_array
end
