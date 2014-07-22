#!/usr/bin/env ruby

def setup_secret
	puts "Setting up secret key..."
	puts `rails generate figaro:install`
end

def prod_db
	puts "Setting up production database..."
	puts `RAILS_ENV=production rake db:create db:schema:load`
end

def clean_assets
	puts 'Cleaning assets'
	puts `rake assets:clean`
end

def compile_assets
	puts 'Compiling assets'
	puts `rake assets:precompile`
end

def prod_server
	puts "Starting server in production mode..."
	puts `rails server -e production`
end

setup_secret
prod_db
clean_assets
compile_assets
prod_server