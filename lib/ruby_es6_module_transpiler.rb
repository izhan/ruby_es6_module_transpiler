require "ruby_es6_module_transpiler/version"
require 'execjs'
require 'json'

# Convert JavaScript files written using the ES6 draft specification
# module syntax to existing library-based module systems such as AMD, 
# CommonJS, or simply globals.  Based off of Square's ES6 Module
# Transpiler project
module RubyES6ModuleTranspiler
  class << self
    # JS code to be transpiled
    attr_accessor :js_code

    # ExecJS object used to execute Javascript within Ruby
    Node = ::ExecJS::ExternalRuntime.new(
      name: 'Node.js (V8)',
      command: ['nodejs', 'node'],
      runner_path: File.expand_path('../support/es6-node-runner.js', __FILE__),
      encoding: 'UTF-8'
    )
    
    # Transpiles given JS code into library-based module systems.
    # Defaults to AMD.  Also allows optional parameters typically passed
    # to Square's ES6 Transpiler in options hash.
    #
    # @param code [String] the Javscript code to be transpiled
    # @option opts [String] :type specify whether to transpile into AMD, CommonJS or globals
    # @option opts [String] :module_name overriding default module name
    def transpile(code, options = {})
      @js_code = code
      Node.exec(generate_source(options))
    end

    private
      def transpiler_js_path
        File.expand_path('../support/es6-module-transpiler.min.js', __FILE__)
      end

      def generate_source(options)
        source = <<-SOURCE
          var Compiler, compiler, output;
          Compiler = require("#{transpiler_js_path}").Compiler;
          compiler = new Compiler(#{::JSON.generate(@js_code, quirks_mode: true)}, '#{module_name(options)}', #{options.to_json});
          return output = compiler.#{compiler_type(options)}();
        SOURCE
      end

      def read_js_file(path)
        file = File.open(path, "rb")
        data = file.read
        file.close
        data
      end

      def compiler_type(options)
        available_types = {
          amd: 'AMD',
          cjs: 'CJS',
          yui: 'YUI',
          globals: 'Globals'
        }

        if options[:type]
          type = available_types[options[:type].downcase.to_sym] || 'AMD'
        else
          type = 'AMD'
        end

        "to#{type}"
      end

      def module_name(options)
        options[:moduleName]
      end
  end
end