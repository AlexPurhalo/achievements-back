### Usage
    $ bundle install
    $ sequel -m db/migrations/ sqlite://db/database.db
    $ rackup -p 5000
     
### Testing
    $ sequel -m db/migrations/ sqlite://db/test.db
    $ rspec
