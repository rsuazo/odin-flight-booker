# README

Project: Flight Booker [https://theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms?ref=lnav]

In this project, you’ll get a chance to tackle some more advanced forms. This is the kind of thing you’ll have to work with when handling user orders for anything more complicated than an e-book. In this case, we’ll build the first three steps of a typical checkout process for booking a one-way flight:

A typical airline booking flow:

Enter desired dates / airports and click “Search”
Choose from among a list of eligible flights
Enter passenger information for all passengers
Enter billing information
Step 4 would be done via integration of something like Paypal, via a gem or an SDK or Stripe.

Assignment
We’ll be creating a one-way flight booker. You’ll get lots of practice populating and building dropdown menus, radio buttons, and nested submissions. Let the fun begin!

This project will require you to seed your database, so use your db/seeds.rb file to write the code necessary to populate Airports and Flights. One trick for toy apps like this (don’t do it for production!) is to make your seeds file ::delete_all items from each table in your database and then completely repopulate them. That way, when you create a new model or change how you want your sample data set up, you can just update the seeds.rb file and rerun $ rake db:seed.
