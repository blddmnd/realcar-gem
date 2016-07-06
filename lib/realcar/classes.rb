require 'active_support'

module Realcar

  CLASSES = ['Cars', 'PricingRules', 'Services', 'Settings']

  CLASSES.each do |c|
    Realcar.const_set c, Class.new(Client) { self.resource_name = ActiveSupport::Inflector.tableize(c) }
  end

end
