Nickel
======

Nickel extracts date, time, and message information from naturally worded text.

[![Code Climate](https://codeclimate.com/github/iainbeeston/nickel.png)](https://codeclimate.com/github/iainbeeston/nickel)
[![Build Status](https://travis-ci.org/iainbeeston/nickel.png?branch=master)](https://travis-ci.org/iainbeeston/nickel)
[![Coverage Status](https://coveralls.io/repos/iainbeeston/nickel/badge.png)](https://coveralls.io/r/iainbeeston/nickel)

Install
-------

```
$ gem install nickel
```

Usage
-----

A single occurrence
```
  n = Nickel.parse("use the force on july 1st at 9am", Time.now)
  n.message                       #=> "use the force"
  n.occurrences.first.start_date  #=> "20110701"
```

A daily occurrence
```
  n = Nickel.parse "wake up everyday at 11am"
  n.message                       # => wake up
  n.occurrences[0].type           # => daily
  n.occurrences[0].start_time     # => 11:00:00
```

A weekly occurrence
```
  n = Nickel.parse "guitar lessons every tuesday at 5pm"
  n.message                       # => guitar lessons
  n.occurrences[0].type           # => weekly
  n.occurrences[0].day_of_week    # => 1
  n.occurrences[0].interval       # => 1
  n.occurrences[0].start_time     # => 17:00:00
```

A day monthly occurrence
```
  n = Nickel.parse "drink specials on the second thursday of every month"
  n.message                       # => drink specials
  n.occurrences[0].type           # => daymonthly
  n.occurrences[0].day_of_week    # => 4
  n.occurrences[0].week_of_month  # => 2
  n.occurrences[0].interval       # => 1
```

A date monthly occurrence
```
  n = Nickel.parse "pay credit card every month on the 22nd"
  n.message                       # => pay credit card
  n.occurrences[0].type           # => datemonthly
  n.occurrences[0].date_of_month  # => 22
  n.occurrences[0].interval       # => 1
```

Multiple occurrences
```
  n = Nickel.parse "band meeting every monday and wednesday at 2pm"
  n.message                       # => band meeting
  n.occurrences[0].type           # => weekly
  n.occurrences[0].day_of_week    # => 0
  n.occurrences[0].start_time     # => 14:00:00
  n.occurrences[1].type           # => weekly
  n.occurrences[1].day_of_week    # => 2
  n.occurrences[1].start_time     # => 14:00:00
```

Setting current time
```
  n = Nickel.parse "lunch 3 days from now", DateTime.new(2010,3,31)
  n.message                       # => lunch
  n.occurrences[0].start_date     # => 20100403
```

Running Tests
-------------

```
  $ rake test
```
