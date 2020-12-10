# geckodriver-bin

*Note: This is a maintained fork of the abandoned gem [geckodriver-helper](https://github.com/DevicoSolutions/geckodriver-helper)*

[![Gem Version](https://badge.fury.io/rb/geckodriver-bin.svg)](https://badge.fury.io/rb/geckodriver-bin)

Easy installation and use of [geckodriver](https://github.com/mozilla/geckodriver), that provides the HTTP API 
described by the WebDriver protocol to communicate with Gecko browsers, such as Firefox.

* [https://github.com/0rvar/geckodriver-bin](https://github.com/0rvar/geckodriver-bin)


# Description

`geckodriver-bin` installs an executable, `geckodriver`, in your
gem path.

This script will, if necessary, download the appropriate binary for
your platform and install it into `~/.geckodriver-bin`, then exec
it.

# Usage

If you're using Bundler and Capybara, it's as easy as:

    # Gemfile
    gem 'geckodriver-bin'

then, in your specs:

    Capybara.register_driver :selenium do |app|
      options = ::Selenium::WebDriver::Firefox::Options.new
      # Uncomment line below to run firefox in headless mode
      # options.args << '--headless'

      Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
    end



# Updating Geckodriver

If you'd like to force-upgrade to the latest version of geckodriver,
run the script `gecko_updater`


# License

MIT licensed, see LICENSE.txt for full details.


# Credit

This is a maintained fork of the gem [geckodriver-helper](https://github.com/DevicoSolutions/geckodriver-helper).

The idea and some features comes from [@flavorjones's](https://github.com/flavorjones) project
`chromedriver-helper`. That saves setup time and works pretty good from the box.

