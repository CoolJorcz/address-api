# Addresses API

This is a Rails API that has two entities, /addresses and /search (currently only exposed for addresses)


## Prerequisites
- Ruby 2.7.1
- Postgres 12 (https://postgresapp.com/ is great if you're working on a Mac)
- Bundler

## Setup
The following command will install dependencies, setup, migrate, and seed the database
`bin/setup`

## Tests
`bundle exec rspec spec`

## How to use API

1. Launch a server: `bundle exec rails server`
2. The following endpoints are available:
	#### Address Management API
	```
	GET /addresses/				Retrieves all addresses
	GET /addresses/:id 			Retrieves specified address
	POST /addresses/:id 		Creates an addresses
	PUT/PATCH /addresses/:id 	Updates an address
	DELETE /addresses/:id 		Deletes an address
	```

	#### Search API
	```
	GET /search/addresses?q=/*address query string*/   Returns matching address from query
	```

## Upcoming changes
- API versioning and namespacing
- Authentication/Authorization
- Enable CORS
- Deployment