# README

## TODO

* Please utilize git and commit as you go!

- That last developer - they did a number on the seeds, please refactor them!
- For some reason the index page will not render after the orders are seeded...
- Sort the orders into 2 categories on the index page - shipped and not shipped.  Sort the shipped orders by shipped date.
- Add an order entry screen that allows creating an order with multiple line items.
- The expedited flag on an order can't be disabled once it's been enabled. Find and fix the bug.

* Bonus - Ascii art? (for Austin)
## Setup

```
bundle install
bundle exec rails db:create db:migrate db:seed
bundle exec rspec
rake ascii:print_art
```

## Submission
Send a link to your Fork of this code to [dev@pairin.com](mailto:dev@pairin.com) with any notes on what you did and why.
