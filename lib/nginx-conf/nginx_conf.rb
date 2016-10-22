require_relative 'conf'



def nginx_conf &block
  Conf.new(%i(server load_module), &block).to_s
end
