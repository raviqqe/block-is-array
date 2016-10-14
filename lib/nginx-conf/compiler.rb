class Compiler
  @@spaces = ' ' * 4

  def compile hash
    @indents = 0
    compile_hash_without_brackets hash
  end

  def compile_elem object
    case object
    when Hash
      compile_hash object
    when Array
      object.map{ |o| compile_elem(o) }.join(' ')
    when -> (o) { o.respond_to? :to_s }
      object.to_s
    else
      exit "You sucks!"
    end
  end

  def compile_hash hash
    s = "{\n"
    @indents += 1
    s += compile_hash_without_brackets hash
    @indents -= 1
    s + indent('}')
  end

  def compile_hash_without_brackets hash
    hash.map do |key, values|
      s = case key
      when :servers
        values.map do |config|
          compile_hash_item :server, [config]
        end.join()
      else
        compile_hash_item key, values
      end

      indent(s) + "\n"
    end.join()
  end

  def compile_hash_item key, values
    key.to_s + ' ' + compile_elem(values) + (values[-1].is_a?(Hash) ? "" : ";")
  end

  def indent line
    @@spaces * @indents + line
  end
end
