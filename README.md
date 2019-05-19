# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Jungle was built with users in mind from the main catalog to each products detail pages.

## Final Product

![Homepae](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Homepage.png
)
![Register](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Register.png)

![Login](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Login.png)

![Badge](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Badge.png)

![Mycart](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Mycart.png)

![Description](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Description.png)

![Review1](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Review1.png)

![Review2](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Review2.png)

![Review3](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Review3.png)

![Payment2](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Payment2.png)

![Payment1](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Payment1.png)

![Authentication](https://github.com/Gimorhee/jungle-rails/blob/master/Image/Authentication.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Functional featuress implemented
* Feature: Sold-out Badge
    * When a product quantity reaches 0, a soldout badge should be displayed and notify customers that the product is sold-out

* Feature: Admin Acess
    * Only admin users are allow to add/edit categories and products
    * User must enter HTTP auth login/password to acces admin functionality

* Feature: User Authentication
    * As a Visitor I can go to the registration page from any page in order to create an account
    * As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
    * As a Visitor I can sign in using my e-mail and password
    * As a user, I can log out from any page
    * As a User I cannot sign up with an existing e-mail address (uniqueness validation)
    * Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem

* Feature: Email Receipt
    * When the order is processed, users will get a notification email with summarized order information

* Feature: Product Rating
   * As a visitor I can view the overall rating of products as I browse the catalog
    * As a visitor I can view the list of ratings and reviews when viewing the product detail
    * As a logged in user I can rate & review a product in a single step
    * As a logged in user I can delete a rating or review that I previously created