require 'active_support'

module Realcar
  CLASSES = ['Cars', 'PricingRules', 'Services']

  CLASSES.each do |c|
    Realcar.const_set c, Class.new(Client) { self.resource_name = ActiveSupport::Inflector.tableize(c) }
  end

end
