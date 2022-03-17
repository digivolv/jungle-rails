# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

### The Home Page
!['main-page']()
_The main page shows off the catelog of all of the products and supports login/signup functionality._

### My Cart
!['Cart']()
_Add, remove, and adjust the quantities of items in your cart as needed._

### Payment Options
!['Payment'](https://github.com/Vptrinh/Jungle/blob/master/public/images/Jungler-Payment.PNG?raw=true)
_Supports payment testing using Stripe Testing._

## User Stories / Features 
* Sold Out Badge
* When a product has 0 quantity, a sold out badge should be displayed on the product list page

### Feature: Admin Categories
* Admin users can list and create new categories
* Admins can add new products using the new category
* Restful routes (resources) are used

### User Authentication
* As a Visitor I can go to the registration page from any page in order to create an account
* As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
* As a Visitor I can sign in using my e-mail and password
* As a User I can log out from any page
* As a User I cannot sign up with an existing e-mail address (uniqueness validation)
* Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem

### Order Details Page
The order page contains items, their image, name, description, quantities and line item totals
The final amount for the order is displayed

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
