# README

## Setup
Ruby version
<pre>ruby-2.5.5</pre>

Configuration
<pre>bundle install</pre>

Database creation
<pre>
bundle exec rake db:create
bundle exec rake db:migrate
</pre>

Database initialization
<pre>bundle exec rake db:seed</pre>

How to run the test suite
<pre>bundle exec rspec</pre>

Deployment instructions
<pre>bundle exec rails s</pre>

## Database Tables
<pre>
Product Table
- has many Units

Fields:
title - required; must not be blank
manufacturer - required; must not be blank
</pre>
<pre>
Unit Table
- belongs to Product

Fields:
product_id - required; must exist
status - required; either "active" or "inactive"
condition - required; either "new" or "used"
price_cents - must be greater than 0
</pre>

## API
### GET /products
<pre>
[
    {
        "title": "Synergistic Iron Watch",
        "manufacturer": "Wolff and Sons"
    },
    {
        "title": "Intelligent Granite Table",
        "manufacturer": "Hills Group"
    }
]

200 OK
</pre>

### GET /products/:id
<pre>
{
    "title": "Synergistic Iron Watch",
    "manufacturer": "Wolff and Sons"
}

200 OK
</pre>

### GET /products/:id/units
<pre>
{
    "title": "Synergistic Iron Watch",
    "manufacturer": "Wolff and Sons",
    "units": [
        {
            "product_id": 1,
            "status": "active",
            "condition": "new",
            "price_cents": 999
        },
        {
            "product_id": 1,
            "status": "inactive",
            "condition": "used",
            "price_cents": 899
        }
    ]
}

200 OK
</pre>

### POST /products
<pre>
{
	"title": "fake title",
	"manufacturer": "fake manufacturer"
}

201 Created
</pre>

### PUT /products/:id
<pre>
{
	"title": "fake title",
	"manufacturer": "fake manufacturer"
}

200 OK
</pre>

### GET /units
<pre>
[
    {
        "product_id": 1,
        "status": "active",
        "condition": "new",
        "price_cents": 999
    },
    {
        "product_id": 1,
        "status": "inactive",
        "condition": "used",
        "price_cents": 899
    }
]

200 OK
</pre>

### POST /units
<pre>
{
    "product_id": 1,
    "status": "active",
    "condition": "new",
    "price_cents": 999
}

201 Created
</pre>
