require "tilt/template"
require "execjs"
require 'sprockets'

module Templebars
  module Rails
    # Tilt template renderer for precompiling Handlebars templates and storing
    # them in a global Templates object.
    class HandlebarsTemplate < ::Tilt::Template
      SETUP_GLOBAL = "('undefined' == typeof #{Templebars::Rails::GLOBAL}) && (#{Templebars::Rails::GLOBAL} = {})"

      def self.default_mime_type
        "application/javascript"
      end

      def initialize_engine; end

      def prepare; end

      def evaluate( scope, locals, &block )
        name = scope.logical_path.sub( /^templates\//, "" )
        precompiled_js = precompile( data )
        template_declaration = "#{Templebars::Rails::GLOBAL}[\"#{name}\"] = Handlebars.template(#{precompiled_js});"
        "#{SETUP_GLOBAL}\n#{template_declaration}\n"
      end

      protected

      def precompile( template )
        runtime.call( "Handlebars.precompile", template )
      end

      def runtime
        @runtime ||= ExecJS.compile( handlebars_js )
      end

      def handlebars_js
        path = File.join( File.dirname(__FILE__), "..", "..", "..", "vendor", "assets", "javascripts", "handlebars.js" )
        File.read( path )
      end
    end

    Sprockets.register_engine '.handlebars', HandlebarsTemplate
    Sprockets.register_engine '.hbs', HandlebarsTemplate
    Sprockets.register_engine '.hb', HandlebarsTemplate
  end
end
