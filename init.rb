###Food Finder###

APP_ROOT = File.dirname(__FILE__)

# require "#{App_root}/lib/guide"
# require File.join(App_root,'lib', 'guide')

$:.unshift(File.join(APP_ROOT,'lib'))
require 'guide'

guide = Guide.new('resturants.txt')
guide.launch!