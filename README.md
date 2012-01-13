# templebars

`templebars` allows you to precomile Handlebars templates and make them available globally in a `Templates` object. (This can be set via `Templebars::Rails::GLOBAL`) Create files with a "handlebars", "hbs", or "hb" extension inside of a `templates/` directory in any `assets/javascripts/` directory:

```
app/assets/javascripts/templates/todo_item.js.handlebars
```

You can then access it like any other JavaScript asset:

```ruby
javascript_include_tag( "templates/todo_item" )
```

The above template would be stored as `Templates.todo_item`.

## Handlebars

This gem also provides Handlebars 1.0.beta.6 to the Rails assert pipeline via `handlebars`. You can include it in other JS files:

```js
//= require handlebars
```

You can also include it via a regular ol' `javascript_include_tag` call:

```ruby
javascript_include_tag( "handlebars" )
```

## Installation

Add this to your Gemfile, preferably in the `:assets` gem group:

    gem "templebars"

Done. Go forth, grasshopper.
