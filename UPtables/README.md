# README

UPtables is a [university timetabling](http://www.cs.uni-potsdam.de/wv/pdfformat/basotainsc13a.pdf) application tailored to the needs of the [department of computer science](http://www.cs.uni-potsdam.de/) at the [University of Potsdam](https://www.uni-potsdam.de/en/), Germany.

It uses [Ruby on Rails](http://rubyonrails.org/) as a frontend and the [potassco suite](http://potassco.sourceforge.net/) for problem solving.


## System dependencies

### Potassco Suite

Install necessary binaries with your local package manager, see documentation on the [Potassco Website](http://potassco.sourceforge.net/).
Precompiled binaries are available for Mac OS X (homebrew), Debian, Ubuntu and Archlinux.

Make sure you've got the recent version 4.4 of gringo that understands the specified syntax of the [ASP logic program language](https://www.mat.unical.it/aspcomp2013/files/ASP-CORE-2.03b.pdf).

* Gringo (version 4.4.0)
* Clasp (version 3.0.6)

### Ruby version

* Ruby version (version 2.2.2)

### Ruby gems

* Rails (version 4.2.0)
* Bundler (version 1.8.3)


## Configuration



## Database creation
In order to create the database and some seed data as a starting point:

```shell
rake db:create db:migrate db:seed
```


## Usage

```
rails s
```

Then visit http://localhost:3000/

## Tests
Run rspec and cucumber tests

```shell
rake spec
```

```shell
rake cucumber
```

Run only those cucumber scenarios that consider the web application (frontend):
```
bundle exec cucumber --require features features/interface
```

Run only those cucumber scenarios that consider the asp problem solving:
```
bundle exec cucumber --require features features/interface
```


## Architecture

Rails web application in /app
Asp constraints and asp related classes under /lib/asp
Tests in /spec
Cucumber tests under /features


