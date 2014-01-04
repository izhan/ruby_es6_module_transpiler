module SpecHelpers
  module FileHelpers
    def read_file(file)
      k = File.expand_path("../../../js-tests/#{file}", __FILE__)
      file = File.open(k, "rb")
      data = file.read
      file.close
      data
    end
  end
end