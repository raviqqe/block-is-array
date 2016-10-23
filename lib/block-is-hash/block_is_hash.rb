require_relative 'blockishash'



def block_is_hash repeats, &block
  BlockIsHash.new(repeats, &block).to_hash
end
