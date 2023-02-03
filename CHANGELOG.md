## [1.0.2] - 2023-01-30
- Increment gem version to force fresh installs after `.gitignore` changes

## [1.0.1] - 2023-01-30
- Fix `CustomField` and `Refund` not inheriting from `Base`

## [1.0.0] - 2023-01-22
- All endpoint classes respond without instantiation:
  - `Bloomerang::Constituent.fetch()` instead of `Bloomerang::Constituent.new.fetch()`
- `rails g bloomerang:initializer`
  - Copies configuration file in to "rails_root/config/initializers"

## [0.2.1] - 2023-01-22
- move bloomerang_config file to new location

## [0.2.0] - 2023-01-21

- Release by [@chiperific](https://github.com/chiperific/) from https://github.com/chiperific/bloomerang_api
- Breaking changes from v0.1.0:
  - Rename `#all` methods to `#fetch`
  - Rename `#show` methods to  `#get`
- Addition of the following classes:
  - address
  - appeal
  - campaign
  - custom_field
  - email
  - email_interest
  - household
  - interaction
  - note
  - phone
  - pledge
  - refund
  - relationship
  - soft-credit
  - tribute
  - task
- Updates to the following classes:
  - constituent
  - fund
  - transaction

  ## [0.1.0] - 2022-03-10

  - Initial release by [@allynfolksjr](https://github.com/allynfolksjr) from https://github.com/mcsweeneys/bloomerang with base classes:
    - constituent
    - fund
    - transaction
