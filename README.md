# Repo Viewer README

This application will allow the user to login with their [Gihub](https://github.com/) credentials and view a list of their public and private repositories.

Video demo of the application

![Demo](https://j.gifs.com/E8zMLv.gif)

## Summary

  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Author](#author)

## Getting Started

### Prerequisites

These setup instructions are for Mac OS.

This project was built using `Ruby 2.5.3`, `Rails 5.2.4.3` and `PostgreSQL` as the database.

### Local Setup

To setup locally, follow these instructions:
  * __Clone Repo__
    * Clone and add the code to your local computer.
  * __Install Gems__
    * Install all gems in the Gemfile using the following commands:
    ```ruby
    $ bundle install
    $ rails g rspec:install
    $ bundle exec figaro install
    ```

    * The gems used for this project:
    ```ruby
    gem 'faraday'
    gem 'figaro'
    gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
    gem 'omniauth-rails_csrf_protection', '~> 0.1'

    group :development, :test do
      gem 'rspec-rails'
      gem 'pry'
    end

    group :test do
      gem 'capybara'
    end
    ```

  * __Set Up Local Database and Migrations__
    * Run `rake db:create` to create the database.

  * __Create OmniAuth Keys__
    * Go to Github [Developer Settings](https://github.com/settings/developers) and create an OAuth App, which will provide you with the Client ID and the Client Secret you will need.

    * Reference the OmniAuth [documentation](https://github.com/omniauth/omniauth-github) for more information. This project is using an extra OmniAuth [gem](https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284) to protect against CSRF attacks.

    * After you have the ID and Secret, add them in the `config/application.yml` file as follows:
      ```ruby
      GITHUB_KEY: <YOUR Client ID HERE>
      GITHUB_SECRET: <YOUR Client Secret HERE>
      ```

## Running the tests

Run the command `bundle exec rspec` in the terminal.  You should see 5 passing tests and 2 skipped tests. Testing is a work in progress.

## Author

- **Sheryl Stillman** - *Turing Student* - [Github Profile](https://github.com/stillsheryl) - [Turing Alum Profile](https://alumni.turing.io/alumni/sheryl-stillman) - [LinkedIn](https://www.linkedin.com/in/sherylstillman1/)
