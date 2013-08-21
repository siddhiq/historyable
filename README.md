# Historyable

Tracks model attributes changes

[![Gem Version](https://badge.fury.io/rb/historyable.png)](https://rubygems.org/gems/historyable)

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'historyable'
```

And then execute

```bash
$ bundle install
```

Run the migration to add the `changes` table:

```bash
$ rails generate historyable:install
```

## Usage

```ruby
class User < ActiveRecord::Base
  has_history :first_name, :last_name
end
```

And now you can:

```ruby
u = User.new
u.first_name = 'Philippe'
u.save

u.first_name_history
# => [
        {
          "attribute_value" => "Philippe",
          "changed_at" => Tue, 20 Aug 2013 20:39:09 UTC +00:00
        }
      ]


u.first_name = 'Jean-Philippe'
u.save
u.first_name_history
# => [
        {
          "attribute_value" => "Jean-Philippe",
          "changed_at" => Tue, 20 Aug 2013 16:20:00 UTC +00:00
        },
        {
          "attribute_value" => "Philippe",
          "changed_at" => Tue, 20 Aug 2013 16:20:10 UTC +00:00
        }
      ]
```

## Contributing

See [CONTRIBUTING.md](https://github.com/hooktstudios/historyable/blob/master/CONTRIBUTING.md) for more details on contributing and running test.

## Credits

![hooktstudios](http://hooktstudios.com/logo.png)

[historyable](https://rubygems.org/gems/historyable) is maintained and funded by [hooktstudios](http://github.com/hooktstudios).
