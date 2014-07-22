#!/usr/bin/env ruby

def setup_secret
	puts `rails generate figaro:install`
end

def prod_server
	puts `rails server -e production`
end

setup_secret
prod_server