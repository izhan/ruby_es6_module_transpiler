require 'spec_helper'
describe RubyES6ModuleTranspiler do
  describe "for importing es6" do
    let(:input) { read_file("import-es6.js") }
    it "should default to amd" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input)
      expected = read_file("import-amd.js")
      expect(transpiled_file).to eq(expected)
    end

    it "should allow for cjs compile" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input, { type: "CJS"})
      expected = read_file("import-cjs.js")
      expect(transpiled_file).to eq(expected)
    end

    it "should allow for yui compile" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input, { type: "YUI"})
      expected = read_file("import-yui.js")
      expect(transpiled_file).to eq(expected)
    end

    it "should allow for globals compile" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input, { type: "Globals"})
      expected = read_file("import-globals.js")
      expect(transpiled_file).to eq(expected)
    end
  end

  describe "for exporting es6" do
    let(:input) { read_file("export-es6.js") }
    it "should default to amd" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input)
      expected = read_file("export-amd.js")
      expect(transpiled_file).to eq(expected)
    end

    it "should allow for cjs compile" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input, { type: "CJS"})
      expected = read_file("export-cjs.js")
      expect(transpiled_file).to eq(expected)
    end

    it "should allow for yui compile" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input, { type: "YUI"})
      expected = read_file("export-yui.js")
      expect(transpiled_file).to eq(expected)
    end

    it "should allow for globals compile" do
      transpiled_file = RubyES6ModuleTranspiler.transpile(input, { type: "Globals"})
      expected = read_file("export-globals.js")
      expect(transpiled_file).to eq(expected)
    end
  end
end
