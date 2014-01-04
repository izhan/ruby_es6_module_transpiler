require 'test/unit'
require 'ruby_es6_module_transpiler'

class ES6ModuleTranspilerTest < Test::Unit::TestCase
  def test_default
    ES6ModuleTranspiler.test
  end

  # def test_amd
  #   assert_equal "hello world",
  #     Hola.hi("english")
  # end

  # def test_cjs
  #   assert_equal "hello world",
  #     Hola.hi("ruby")
  # end

  # def test_yui
  #   assert_equal "hola mundo",
  #     Hola.hi("spanish")
  # end

  # def test_global
  #   assert_equal "hola mundo",
  #     Hola.hi("spanish")
  # end
    private 
      def read_input
        k = File.expand_path('../js-tests/import-es6.js', __FILE__)
        file = File.open(k, "rb")
        data = file.read
        file.close
        data
      end

      def read_output
        k = File.expand_path('../js-tests/import-amd.js', __FILE__)
        file = File.open(k, "rb")
        data = file.read
        file.close
        data
      end
end