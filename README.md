# Urbanite
![Build Status](https://codeship.com/projects/f9427670-dcb9-0133-7a9d-767c373684f4/status?branch=master)
![Code Climate](https://codeclimate.com/github/nwalberts/urbanite.png)
![Coverage Status](https://coveralls.io/repos/nwalberts/urbanite/badge.png)

Urbanite is a city review app built with Ruby on Rails. Urbanite was designed to provide users with a place to leave feedback about cities they have visited and give users a resource for gathering information on cities. Users may add cities or add reviews to existing cities. Reviews may be voted on by other users.

https://mighty-wildwood-43120.herokuapp.com/

## Contributors
* Nick Alberts
* Britta Carroll
* Kamille Delgardo
* Mia Gaulin
* Greg Ward

## Features
* Users may add a city and view details and reviews (if they exist) of that city.
* Users may add a review to a city
* Users may upvote or downvote reviews
* User may add a profile picture and view their profiles
* User is notified by email when a review is left on a city they have added
* Admins may delete inappropriate content
* Users may edit or delete items they have added


## Technologies
* User functionality added with Devise
* Pagination functionality added with Kaminari
* Voting implemented with Ajax
* Photo uploading with CarrierWave
* Email functionality tested with ActionMailer
* Feature testing with Capybara
* Model testing with Rspec
* Styling framework with Foundation
* Deployment on Heroku
* Email development with MailCatcher. Use ``` gem install mailcatcher && mailcatcher ``` to run.
* Email production with SendGrid & Heroku
