class BlockIsArray
  def initialize repeats, &block
    @repeats = repeats
    @array = {}
    instance_eval(&block)
  end

  def method_missing name, *args, &block
    if block
      args.push BlockIsArray.new(@repeats, &block).to_array
    end

    value = args.length == 1 ? args[0] : args

    if @repeats.include? name and @array.include? name
      @array[name].push value
    elsif @repeats.include? name
      @array[name] = [value]
    elsif @array.include? name
      raise "#{name} entry is declared twice."
    else
      @array[name] = value
    end
  end

  def to_array
    @array
  end
end
