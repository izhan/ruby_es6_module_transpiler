module SpecHelpers
  module FileHelpers
    def read_input
      k = File.expand_path('../../../js-tests/import-es6.js', __FILE__)
      file = File.open(k, "rb")
      data = file.read
      file.close
      data
    end

    def read_output
      k = File.expand_path('../../../js-tests/import-amd.js', __FILE__)
      file = File.open(k, "rb")
      data = file.read
      file.close
      data
    end
  end
end