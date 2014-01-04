require "ruby_es6_module_transpiler/version"

require 'execjs'
require 'json'

module RubyES6ModuleTranspiler
  class << self
    attr_accessor :js_code

    Node = ::ExecJS::ExternalRuntime.new(
      name: 'Node.js (V8)',
      command: ['nodejs', 'node'],
      runner_path: File.expand_path('../support/es6-node-runner.js', __FILE__),
      encoding: 'UTF-8'
    )
    
    # accepts amd, cjs, yui, or global.  defaults to amd.
    def transpile(code, options = {})
      @js_code = code
      Node.exec(generate_source(options))
    end

    private
      def transpiler_js_path
        File.expand_path('../support/es6-module-transpiler.js', __FILE__)
      end

      def generate_source(options)
        type = options[:type] || :AMD
        source = <<-SOURCE
          var Compiler, compiler, output;
          Compiler = require("#{transpiler_js_path}").Compiler;
          compiler = new Compiler(#{::JSON.generate(@js_code, quirks_mode: true)});
          return output = compiler.to#{type}();
        SOURCE
      end

      def read_js_file(path)
        file = File.open(transpiler_js_path, "rb")
        data = file.read
        file.close
        data
      end
  end
end