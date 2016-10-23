class BlockIsHash
  def initialize repeats, &block
    @repeats = repeats
    @hash = {}
    instance_eval(&block)
  end

  def method_missing name, *args, &block
    if not (args or block)
      @hash[name]
    end

    if block
      args.push BlockIsHash.new(@repeats, &block).to_hash
    end

    value = args.length == 1 ? args[0] : args

    if @repeats.include? name and @hash.include? name
      @hash[name].push value
    elsif @repeats.include? name
      @hash[name] = [value]
    elsif @hash.include? name
      raise "#{name} entry is declared twice."
    else
      @hash[name] = value
    end
  end

  def to_hash
    @hash
  end
end
