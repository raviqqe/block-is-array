class BlockIsArray
  def initialize &block
    @array = []
    instance_eval(&block)
  end

  def method_missing name, *args, &block
    if block
      args.push BlockIsArray.new(&block).to_array
    end

    @array.push args.unshift(name)
  end

  def to_array
    @array
  end
end
