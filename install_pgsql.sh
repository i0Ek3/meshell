# !/bin/bash

brew install postgresql
initdb /usr/local/var/postgres
brew services start postgresql
