# README

UPtables is a [university timetabling](http://www.cs.uni-potsdam.de/wv/pdfformat/basotainsc13a.pdf) application tailored to the needs of the [department of computer science](http://www.cs.uni-potsdam.de/) at the [University of potsdam](https://www.uni-potsdam.de/en/), Germany.

It uses [ruby on rails](http://rubyonrails.org/) as a frontend and the [potassco suite](http://potassco.sourceforge.net/) for problem solving.


## System dependencies

### Potassco Suite

Install necessary binaries with your local package manager, see documentation on the [potassco website](http://potassco.sourceforge.net/).
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

The app comes preconfigured with a sqlite3 database as a default. Feel free to fit the [database configuration](config/database.yml) to your needs.

## Database creation

In order to create the database and some seed data as a starting point:

```shell
$ rake db:create db:migrate db:seed
```


## Usage
On your command line change to the application directory and run:
```
$ rails s
```

Then point your browser at http://localhost:3000/

## Tests
Run rspec and cucumber tests:

```shell
$ rake spec
```

```shell
$ rake cucumber
```

Run only those cucumber scenarios that test the web application (user interface):
```
$ rake cucumber:ui
```

Run only those cucumber scenarios that test if the answer set solving constraints work properly:
```
$ rake cucumber:asp
```


## Directory layout

Rails web application under [/app](app).

Asp constraints and asp related classes under [/lib/asp](lib/asp).

Tests in [/spec](spec).

Cucumber tests in [/features](features), with user interface tests in [/interface](features/interface) and asp related scenarios in [/asp](features/asp).



