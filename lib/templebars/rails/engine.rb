module Templebars
  module Rails
    class Engine < ::Rails::Engine
      config.templebars_template_global = "Templates"
    end
  end
end

