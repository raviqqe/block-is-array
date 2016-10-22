require_relative 'compiler'



class Conf
  def initialize repeats, &block
    @repeats = repeats
    @attrs = {}
    instance_eval(&block)
  end

  def method_missing name, *args, &block
    if not (args or block)
      @attrs[name]
    end

    if block
      args.push Conf.new(@repeats, &block).to_hash
    end

    value = args.length == 1 ? args[0] : args

    if @repeats.include? name and @attrs.include? name
      @attrs[name].push value
    elsif @repeats.include? name
      @attrs[name] = [value]
    else
      @attrs[name] = value
    end
  end

  def to_hash
    @attrs
  end

  def to_s
    Compiler.new(@repeats).compile(@attrs)
  end
end
