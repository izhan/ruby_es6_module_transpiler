require 'execjs'

module ES6ModuleTranspiler
  class Transpiler
    attr_accessor :js_code

    Node = ::ExecJS::ExternalRuntime.new(
      name: 'Node.js (V8)',
      command: ['nodejs', 'node'],
      runner_path: File.expand_path('../support/es6-node-runner.js', __FILE__),
      encoding: 'UTF-8'
    )

    def initalize(js_code)
      @js_code = js_code
    end

    def test
      @js_code = "import { get, set } from 'ember';"
      puts self.toAMD
    end
  
    def toAMD
      Node.exec(generate_source(:AMD))
    end

    private
      def transpiler_js_path
        File.expand_path('../support/es6-module-transpiler.js', __FILE__)
      end

      def generate_source(type)
        source = <<-SOURCE
          var Compiler, compiler, output;
          Compiler = require("#{transpiler_js_path}").Compiler;
          compiler = new Compiler("#{@js_code}");
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