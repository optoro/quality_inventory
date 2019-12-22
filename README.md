# README
- [Heroku](#heroku)
- [Setup](#setup)
- [Database Tables](#database-tables)
	* [Product](#product-table)
	* [Unit](#unit-table)
- [API](#api)
	* [Products](#products)
		* [GET /products](#get-products)
		* [GET /products/:id](#get-productsid)
		* [GET /products/:id/units](#get-productsidunits)
		* [POST /products](#post-products)
		* [PUT /products](#put-productsid)
	* [Units](#units)
		* [GET /units](#get-units)
		* [POST /units](#post-units)

----

## Heroku
https://quality-inventory.herokuapp.com

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

----

## Database Tables
### Product Table
<pre>
Product Table
- has many Units

Fields:
title - required; must not be blank
manufacturer - required; must not be blank
</pre>

### Unit Table
<pre>
Unit Table
- belongs to Product

Fields:
product_id - required; must exist
status - required; either "active" or "inactive"
condition - required; either "new" or "used"
price_cents - must be greater than 0
</pre>

----

# API
## Products
### GET /products
<pre>
[
    {
        "id": 1,
        "title": "Synergistic Iron Watch",
        "manufacturer": "Wolff and Sons"
    },
    {
        "id": 2,
        "title": "fake titles",
        "manufacturer": "fake manufacturers"
    }
]

200 OK
</pre>

### GET /products/:id
<pre>
{
    "id": 1,
    "title": "Synergistic Iron Watch",
    "manufacturer": "Wolff and Sons"
}

200 OK
</pre>

### GET /products/:id/units
<pre>
{
    "id": 1,
    "title": "Synergistic Iron Watch",
    "manufacturer": "Wolff and Sons",
    "units": [
        {
            "id": 1,
            "status": "active",
            "condition": "new",
            "price_cents": 999,
            "product_id": 1
        },
        {
            "id": 2,
            "status": "inactive",
            "condition": "used",
            "price_cents": 899,
            "product_id": 1
        }
    ]
}

200 OK
</pre>

### POST /products
<pre>
HEADERS Content-Type: application/json
REQUEST BODY
{
    "title": "fake title",
    "manufacturer": "fake manufacturer"
}

201 Created
</pre>

### PUT /products/:id
<pre>
HEADERS Content-Type: application/json
REQUEST BODY
{
    "title": "fake title",
    "manufacturer": "fake manufacturer"
}

200 OK
</pre>

## Units
### GET /units
<pre>
[
    {
        "id": 1,
        "status": "active",
        "condition": "new",
        "price_cents": 999,
        "product_id": 1
    },
    {
        "id": 2,
        "status": "inactive",
        "condition": "used",
        "price_cents": 899,
        "product_id": 1
    }
]

200 OK
</pre>

### POST /units
<pre>
HEADERS Content-Type: application/json
REQUEST BODY
{
    "id": 1,
    "status": "active",
    "condition": "new",
    "price_cents": 999,
    "product_id": 1
}

201 Created
</pre>
