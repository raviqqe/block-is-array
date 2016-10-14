require_relative 'compiler'


class NginxConf
  def initialize hash
    raise if hash.has_key?(:http)
    @hash = hash.merge({http: {servers: []}})
  end

  def add_server hash
    @hash[:http][:servers].push(hash)
  end

  def compile
    Compiler.new.compile(@hash)
  end
end
