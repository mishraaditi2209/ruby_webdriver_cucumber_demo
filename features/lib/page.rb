require 'rspec'
require 'watir-webdriver'
require 'cucumber'
require 'rake'
require 'spreadsheet'
require 'roo'
# require 'page-object'
require 'faker'
require 'yaml'
require 'pdf/reader'
# require 'spec/spec_helper'
require 'selenium_fury'


include RSpec::Matchers
include SeleniumFury::SeleniumWebDriver::CreateSeleniumWebDriver
require File.dirname(__FILE__) + "/../lib/config/driver_config"
require File.dirname(__FILE__) + "/../lib/pages/homepage"
require File.dirname(__FILE__) + "/../lib/pages/search/search_refinements"



include DemoCucumber