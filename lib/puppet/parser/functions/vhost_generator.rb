class VhostGenerator
  def self.traverse(hash, level = 1)
    output = String.new
    indent = (' ' * (level * 2))
    hash.sort.each do |item|
      key, value = item[0], item[1]
      if value.is_a? Hash
        directive = key.split(' ').first
        options = key.split(' ')[1..-1]
        output << "#{indent}<#{directive} #{options}>\n"
        output << traverse(value, level + 1)
        output << "#{indent}</#{directive}>\n"
      else
        output << "#{indent}#{key} #{value}\n"
      end
    end
    return output
  end
end
module Puppet::Parser::Functions
  newfunction(:vhost_generator, :type => :rvalue) do |args|
    return VhostGenerator.traverse(args[0])
  end
end
