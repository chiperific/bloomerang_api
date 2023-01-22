# Bloomerang

This is an unofficial [bloomerang.co REST API v2](https://bloomerang.co/product/integrations-data-management/api/rest-api/) client for Ruby.


_Note: you must be a Bloomerang customer with an active account to access the API_

This gem is based upon the initial work of [@allynfolksjr](https://github.com/allynfolksjr) at https://github.com/mcsweeneys/bloomerang. They added limited endpoint support for:

  * Constituent
  * Fund
  * Transaction

This gem adds support for [all other endpoints](https://github.com/chiperific/bloomerang_api/tree/main/lib/bloomerang), _except_:

  * Processor
  * User
  * WalletItem


## Installation for Ruby on Rails:

Add this line to your application's Gemfile:

```ruby
gem "bloomerang_api", "~> 1.0"
```

And then execute:

`$ bundle install`

## Setup

1. Get your Bloomerang API Key:

  - Generate your v2.0 API key from [your Bloomerang user settings](https://crm.bloomerang.co/Settings/User/Edit)

2. Add your API key to your app using a secure method:

  - [Credentials](https://edgeguides.rubyonrails.org/security.html#custom-credentials) strategy (preferred):

      ```yaml
      # ./config/credentials.yml
      bloomerang:
        api_key: myapikey
      ```

  - [dotenv](https://github.com/bkeepers/dotenv) strategy:

      ```ruby
      # ./.env
      BLOOMERANG_API_KEY=myapikey
      ```

  - [ENV](https://blog.devgenius.io/what-are-environment-variables-in-rails-6f7e97a0b164) strategy:

      ```bash
      $ export BLOOMERANG_API_KEY=myapikey
      ```

3. Run the generator to create the initializer file:

```bash
$ rails generate bloomerang:initializer
```

This will create the file `./config/initializers/bloomerang.rb` where you can set your API key:

```ruby
require 'bloomerang'

Bloomerang.configure do |config|
  ### Set your Bloomerang API key:
  # Generate your v2.0 API key from your Bloomerang user settings:
  # https://crm.bloomerang.co/Settings/User/Edit
  #
  # UNSECURE: DO NOT ADD THE KEY DIRECTLY TO THIS FILE!
  # It will be exposed in your source code.
  # Instead, use a secure method to store your API key
  #
  # Rails credentials example (preferred):
  # Learn about encrypted credentials: https://edgeguides.rubyonrails.org/security.html#custom-credentials
  # config.api_key = Rails.application.credentials.dig(:bloomerang, :api_key)
  #
  # ENV or dotenv example:
  # Learn about dotenv gem: https://github.com/bkeepers/dotenv
  # config.api_key = ENV["BLOOMERANG_API_KEY"]
end
```

## Usage

### WARNING: NO SANDBOX, PRODUCTION ONLY

Bloomerang does not offer a sandbox environment or any way to test API calls without actually affecting your production data.

## Any POST, PUT and DELETE requests will be run against your live Bloomerang account!

[Please encourage Bloomerang](https://crm.bloomerang.co/Home/FeaturesPortal) to address this issue.

### Standard structure:

- Reading records:
  - `#fetch`: a GET request that returns a batch of records, 50 by default (see paging/batching below for more)
  - `#show`: a GET request returns a single record that matches the provided ID

- Creating, updating and deleting records:
  - `#create`: a POST request that creates a record based on the provided `body` variable.
  - `#update`: a PUT request that updates a record
  - `#delete`: a DELETE request that deletes a record

  __It is highly recommended to reference the [documentation](https://bloomerang.co/product/integrations-data-management/api/rest-api) to identify required and allowed attributes.__

Some `Class`es have custom endpoints. For example:

- `Bloomerang::Campaign.refresh_summaries`
- `Bloomerang::Constituent.fetch_relationships`
- `Bloomerang::Constituent.update_communication_settings`
- `Bloomerang::Constituent.search`
- `Bloomerang::CustomField.categories`

Check [the specific class](https://github.com/chiperific/bloomerang_api/tree/main/lib/bloomerang) for availble methods.

### GET requests:
Most GET requests have URL parameters that can be set.

[Each `Class`](https://github.com/chiperific/bloomerang_api/tree/main/lib/bloomerang) lists the available parameters you can append to `GET` requests, you can also check each endpoints' [documentation](https://bloomerang.co/product/integrations-data-management/api/rest-api).

#### Paging / Batching support:

`#search` methods, `#fetch` methods, and methods that start with `#fetch_` have two parameters in common that allow you to fetch results in batches:

- `skip` - defaults to 0, the number of records to "skip" before returning results
- `take` - defaults to 50, the number of records to return.

Responses will include the total number of results available. For example:

```ruby
params = { skip: 0, take: 50 }
first_fifty_constituents = Bloomerang::Constituent.fetch(params)
```

The result will include these keys:

```json
{
  "Total": 1850, // All records in the database
  "TotalFiltered": 1850, // All records that match query/filters
  "Start": 0,
  "ResultCount": 50,
  "Results": []
```

`"Start"` should be equal to `skip` and `"ResultCount` should be equal to `take`.

Increase your `skip` value by your `take` value to get the next page/batch of records:

```ruby
params = { skip: 50, take: 50 }
next_fifty_constituents = Bloomerang::Constituent.fetch(params)
```

```json
{
  "Total": 1850, // All records in the database
  "TotalFiltered": 1850, // All records that match query/filters
  "Start": 50,
  "ResultCount": 50,
  "Results": []
```

### POST/PUT/DELETE requests:

#### WARNING: Bloomerang has no test/sandbox feature! Any POST, PUT and DELETE requests will be run against your live Bloomerang account! Proceed with caution!


`#update`, and `#delete` methods require a record ID and a `body` object. Not all `Class`es implement a `#delete` endpoint.

`#create` methods require only a `body` object.

__It is highly recommended to reference the [documentation](https://bloomerang.co/product/integrations-data-management/api/rest-api) to identify required and allowed attributes.__

## Examples

```ruby
# fetch the first 50 individual constituents
params = { skip: 0, take: 50, type: "Individual" }
Bloomerang::Constituent.fetch(params)

# fetch the next 50 individual constituents
params = { skip: 50, take: 50, type: "Individual" }
Bloomerang::Constituent.fetch(params)

# get the email addresses (first 50) for a constituent
params = { constituent: "12345" }
Bloomerang::Email.fetch(params)

# create a task
body = {
  "DueDate": "2023-01-21",
  "Subject": "Schedule meeting",
  "Note": "Schedule a meeting with Tom and Sidney to request a renewed family foundation gift",
  "Channel": "Email",
  "Purpose": "ImpactCultivation",
  "UserId": 12, # the ID of the user responsible for the task
  "AccountId": 123456, # the ID of the constituent related to the task
}
Bloomerang::Task.create(body)
```

## Contributing

Bug reports and pull requests are welcome. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/chiperific/bloomerang_api/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bloomerang API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/chiperific/bloomerang_api/blob/main/CODE_OF_CONDUCT.md).
