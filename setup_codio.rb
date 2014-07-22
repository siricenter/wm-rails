#!/usr/bin/env ruby
def bundle_install
	puts `cd ~/workspace`
	puts `bundle install`
end

def install_sqlite
	unless `parts list`.match(/sqlite/)
		puts `parts install sqlite3`
	end
end

def install_mysql
	unless `parts list`.match(/mariadb/)
		puts `parts install mariadb`
	end

	puts `parts start mariadb`
end

def install_postgres
	unless `parts list`.match(/postgresql/)
		puts `parts install postgresql`
	end
	
	puts `parts start postgresql`
end

def install_mongo
	unless `parts list`.match(/mongodb/)
		puts `parts install mongodb`
	end

	puts `parts start mongodb`
end

def setup_database
	puts `rake db:create:all`
	puts `rake db:migrate`
	puts `rake db:seed`
end

def start_server
	puts `cd ~/workspace`
	puts `rails server -d`
end

def get_vimrc
	unless File.exists? "/home/codio/.vimrc"
		`cd ~`
		puts `git clone https://github.com/CJPoll/devenvset`
		puts `mv devenvset/files/default/.vimrc ~`
		puts `rm -rf devenvset`
		`cd ~/workspace`
	end
end

def install_vundle
	puts `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim` unless File.directory? "/home/codio/.vim/bundle/"
end

def install_packages
	packages = [
		"ack",
		"tmux"
	]

	packages.each do |package|
		`parts install #{package}`
	end
end

install_postgres
setup_database
bundle_install
start_server
get_vimrc
install_vundle
install_packages
