require "tilt"
require "execjs"

module Templebars
  # Tilt template renderer for precompiling Handlebars templates and storing
  # them in a global Templates object.
  class HandlebarsTemplate < ::Tilt::Template
    PARTIAL = /^partials\//

    def self.default_mime_type
      "application/javascript"
    end

    def evaluate( scope, locals, &block )
      name = scope.logical_path.sub( /^templates\//, "" )
      register_template_js( name, precompile( data ) )
    end

    protected

    def prepare; end

    def register_template_js( name, precompiled_js )
      if name =~ PARTIAL
        "Handlebars.registerPartial('#{name.sub( PARTIAL, '' )}', Handlebars.template(#{precompiled_js}));"
      else
        global = ::Rails.application.config.templebars_template_global
        <<-JS
          this.#{global} || (this.#{global} = {});
          this.#{global}['#{name}'] = Handlebars.template(#{precompiled_js});
        JS
      end
    end

    def precompile( template )
      runtime.call( "Handlebars.precompile", template, { data: {} } )
    end

    def runtime
      @runtime ||= ExecJS.compile( handlebars_js )
    end

    def handlebars_js
      path = File.expand_path( "../../../vendor/assets/javascripts/handlebars.js", __FILE__ )
      File.read( path )
    end
  end
end

