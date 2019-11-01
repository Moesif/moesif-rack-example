# Moesif Rack Example

[Ruby Rack](http://rack.github.io/) is the most popular Ruby Web frameworks.

[Moesif](https://www.moesif.com) is an API analytics and monitoring platform.
[moesif-rack](https://github.com/Moesif/moesif-rack)
is a middleware that makes integration with Moesif easy for Rack based
applications and frameworks, including Rails.

This example is a Rack application with Moesif Rack integrated.

## Key changes

[moesif-rack's documentation](https://www.moesif.com/docs/server-integration/rack/) has detailed installation instructions and configuration options. Key changes to the base example to enable Moesif:

- Add `gem 'moesif_rack', '~> 1.3.7'` to the Gemfile
- Modify the `config/application.rb` to use your Moesif Application Id.

Your Moesif Application Id can be found in the [_Moesif Portal_](https://www.moesif.com/).
After signing up for a Moesif account, your Moesif Application Id will be displayed during the onboarding steps. 

You can always find your Moesif Application Id at any time by logging 
into the [_Moesif Portal_](https://www.moesif.com/), click on the top right menu,
and then clicking _Installation_.

## How to run

1. Verify Ruby version is 2.3 and above via `ruby -v`

2. Install all dependencies via `bundle install`

3. Be sure to edit the `config/application.rb` to change the application id to your real one obtained from Moesif.

```ruby
# config/application.rb
moesif_options = {
  'application_id' => 'Your Moesif Application Id'
}
```

4. To start the server

```bash
rackup
```

5. See config.ru for some urls that you can hit the server with (e.g. http://localhost:9292/), and the data should be captured in the corresponding Moesif account of the application id.
