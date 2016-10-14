require_relative 'compiler'


class NginxConf
  def initialize hash
    raise if hash.has_key?(:http)
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
end
