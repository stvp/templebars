# templebars

`templebars` allows you to precomile [Handlebars][handlebars] templates
in Rails and make them available globally in a `Templates` object. (This
can be set via `Templebars::Rails::GLOBAL`) Create files with a
"handlebars" or "hbs" extension inside of a `templates/` directory in
any `assets/javascripts/` directory. For example:

    app/assets/javascripts/templates/todo_item.js.handlebars

You can then access it like any other JavaScript asset:

```ruby
javascript_include_tag("templates/todo_item")
```

The above template would be available client-side as
`Templates.todo_item`.

## Handlebars

This gem also provides Handlebars 1.0.beta.6 to the Rails assert
pipeline via `handlebars`. You can include it in other JS files:

```js
//= require handlebars
```

If you don't need to compile templates on the client side, you can
replace the above with this to save space / time:

```js
//= require handlebars.runtime
```

You can also include it via a regular ol' `javascript_include_tag` call:

```ruby
javascript_include_tag("handlebars")
// or
javascript_include_tag("handlebars.runtime")
```

## Installation

Add this to your Gemfile, preferably in the `:assets` gem group:

    gem "templebars"

Done. Go forth, grasshopper.

*This gem is maintained by [Stovepipe Studios][stovepipe].*

[stovepipe]: http://www.stovepipestudios.com
[handlebars]: http://handlebarsjs.com/

