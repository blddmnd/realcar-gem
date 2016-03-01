module Realcar
  CLASSES = ['Cars']

  CLASSES.each do |c|
    Realcar.const_set c, Class.new(Client) { self.resource_name = c.downcase }
  end

end
