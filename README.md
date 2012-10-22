Everything to TV (web app)
==================

This project is a *hack* made during the [Hackday Paris 2012](http://www.hackdayparis.org/2012) on October 20-21, 2012 by [Adrien Jarthon](https://github.com/jarthod), [Jocelyn De La Rosa](https://github.com/dreewoo), [Arnaud Sellier](https://github.com/arnoo-sel) and [Maxime Mouial](https://github.com/hush-hush)

Its a web app meant to be displayed on a connected TV (googleTV, smartTV) that add content to your TV.

It's build in Ruby on rails, with some python and uses an external exec ([e2tv-api](https://github.com/arnoo-sel/e2tv-api)) to fetch data from APIs.

![e2tv home page](http://dl.dropbox.com/u/623972/e2tv.jpg)

Requirements
------------

You need:

* transmission-daemon
* ruby 1.9.3, python
* qt5-base to exec e2tv-api

How to run
----------

    git clone git@github.com:jarthod/e2tv-webapp.git
    cd e2tv-webapp
    git submodule update --init
    bundle install
    bundle exec thin start
