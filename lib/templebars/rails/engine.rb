module Templebars
  module Rails
    class Engine < ::Rails::Engine
      initializer "sprockets.templebars", after: "sprockets.environment", group: :all do |app|
        next unless app.assets

        app.config.templebars_template_global = "Templates"

        app.assets.register_engine( ".handlebars", Templebars::HandlebarsTemplate )
        app.assets.register_engine( ".hbs", Templebars::HandlebarsTemplate )
      end
    end
  end
end

