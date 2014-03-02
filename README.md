# RubyEs6ModuleTranspiler

ES6 Module Transpiler Ruby Gem, a handy little gem to help convert your ES6 code into CommonJS, AMD or YUI formats using Square's [ES6 Module Transpiler](https://github.com/square/es6-module-transpiler).

## Installation

Add this line to your application's Gemfile:

    gem 'ruby_es6_module_transpiler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_es6_module_transpiler

## Usage

_Note that Node.js is required for the transpiling._

Add the necessary require to the file in which the gem is needed

```ruby
require 'ruby_es6_module_transpiler'
```

Call transpile with ES6 code.  By default, it will transpile to AMD.  For example, calling

```ruby
js_code = <<-JS
import { get, set } from 'ember';
JS

RubyES6ModuleTranspiler.transpile(js_code)
```

will return

```javascript
define(
["ember"],
function(__dependency1__) {
  "use strict";
  var get = __dependency1__.get;
  var set = __dependency1__.set;
});
```

You can also add in extra options like so:

```ruby
js_code = <<-JS
import { get, set } from 'ember';
JS

RubyES6ModuleTranspiler.transpile(js_code, { type: "Globals", global: "renamed"})
```

which returns

```javascript
(function(__dependency1__) {
  "use strict";
  var get = __dependency1__.get;
  var set = __dependency1__.set;
})(renamed.ember);
```

Check out Square's [ES6 Module Transpiler](https://github.com/square/es6-module-transpiler) for more info on the various options available.

## Contributing
Feedback and PRs always welcome!

To submit a PR:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Legal

[Licensed under the MIT license](http://opensource.org/licenses/mit-license.php)

## Extra

Please also check out the the [Rails gem](https://github.com/dockyard/es6_module_transpiler-rails) and a [rake pipeline filter](https://github.com/izhan/rake-pipeline-web-filters) that uses this gem!
