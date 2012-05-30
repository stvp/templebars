# templebars

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

Your template file names must be suffixed with the ".handlebars" or
".hbs" extensions in order for Templebars to handle them.

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

*This gem is maintained by [Stovepipe Studios][stovepipe].*

[stovepipe]: http://www.stovepipestudios.com
[handlebars]: http://handlebarsjs.com/

