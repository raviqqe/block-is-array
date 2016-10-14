require_relative 'compiler'


class Conf
  def initialize hash
    raise unless !hash.has_key?(:http)
    @hash = hash.merge({http: {servers: []}})
  end

  def add_server hash
    @hash[:http][:servers].push(hash)
  end

  def compile
    Compiler.new.compile(@hash)
  end
end
