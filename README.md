# templebars

## No longer maintained

This gem targets an outdated version of Rails and is no longer maintained.

`templebars` allows you to precomile [Handlebars][handlebars] templates
in Rails and make them available globally on the client-side in a
`Templates` object.

## Adding Templebars to Rails 3.1+

Add `templebars` to your `Gemfile` in the `assets` group:

```ruby
group :assets do
  ...
  gem 'templebars'
end
```

And run `bundle install` to install it.

Then, you'll need to include the Handlebars runtime in your JavaScript
manifest (`app/assets/javascripts/application.js`):

```javascript
//= require handlebars.runtime
```

If you still need to compile Handlebars templates on the client side,
you'll want to require the full `handlebars`, instead:

```javascript
//= require handlebars
```

## Adding templates

Place your templates in `app/assets/templates/` and require all of them
in your JavaScript manifest (`application.js`):

```javascript
//= require_tree ../templates
```

Your template file names must be suffixed with the ".js.handlebars" or
".js.hbs" extensions in order for Templebars to handle them.

## Using templates

Your templates will be available on the client side via their paths in a
global `Templates` object. For example, a template at
`app/assets/templates/user.handlebars` can be rendered with:

```javascript
Templates['user'](context);
```

And a template at `app/assets/templates/users/detail.handlebars` with:

```javascript
Templates['users/detail'](context);
```

## Using partials

Place partials in `app/assets/templates/partials/` and they will be
available to all of your Handlebars templates. For example,
`app/assets/templates/partials/big_button.js.hbs` can be included with:

```
{{> big_button }}
```

## Using a different global Templates object

To use Templebars with, for example, Ember.js, add the following to your
`config/application.rb`:

```ruby
config.templebars_template_global = "Ember.TEMPLATES"
```

# Version History

* **0.5.0** Add support for partials, upgrade Handlebars to 4.0.5.
* **0.4.0** Drop support for old Rails versions, clean up code, bump sprockets
  and execjs version dependencies.
* **0.3.1** Relax tilt dependency version to ~> 1.3.
* **0.3.0** Update Handlebars to 1.0.0, clean up gem dependencies.
* **0.2.2** Update Handlebars to a custom 1.0.rc.1 build, which fixes [issue #317](https://github.com/wycats/handlebars.js/issues/317).
* **0.2.1** Update execjs and sprockets dependencies.
* **0.2.0** Update Handlebars to 1.0.rc.1.

[handlebars]: http://handlebarsjs.com/

