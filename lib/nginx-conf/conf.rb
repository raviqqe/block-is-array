require_relative 'compiler'


class NginxConf
  def initialize hash
    raise if [:http, :load_module].any? { |k| hash.has_key? k }
    @hash = hash.merge({load_module: [], http: {server: []}})
  end

  def load_module path
    @hash[:load_module].push(path)
  end

  def server hash
    @hash[:http][:server].push(hash)
  end

  def to_s
    Compiler.new.compile(@hash)
  end

  def [] key
    @hash[key]
  end
end
