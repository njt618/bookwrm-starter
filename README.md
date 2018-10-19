# BOOKWRM

Welcome to bookwrm, the social book review app! In this app you will be able to register and log in as a user,
view a collection of books, and read or leave reviews for individual books.

This app is developed with Ruby on Rails, and deployed on Heroku.

## Getting Started
### Prerequisites
+ Ruby 2.4.4
+ Rails 5.2.1
+ Postgres 9.6

### Setup the App
+ Fork the repo to your github account
+ `git clone git@github.com:YOUR-USERNAME/bookwrm-starter.git`
+ `cd bookwrm-starter`
+ update `database.yml`*

### Running in Development
+ `bundle install`
+ `bundle exec rake db:create db:migrate`
+ `rails s`
+ open `localhost:3000`

### Deployment
### Deployment
+ Sign up for Heroku at `https://signup.heroku.com/`
+ Create a new app at `https://dashboard.heroku.com/new-app`
+ Connect the app to this GitHub repository
+ Deploy the `master` branch through `Manual deploy`
+ Click on `Open App` in the top right corner of the page, and view the app in the browser!

### References
+ [Ruby](https://www.ruby-lang.org/en/)
+ [Rails](https://rubyonrails.org/)
+ [Devise](https://github.com/plataformatec/devise)
+ [Heroku](https://www.heroku.com/)
