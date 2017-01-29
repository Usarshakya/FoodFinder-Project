###Food Finder###

App_root = File.dirname(__FILE__)

# require "#{App_root}/lib/guide"
# require File.join(App_root,'lib', 'guide')

$:.unshift(File.join(App_root,'lib'))
require 'guide'

guide = Guide.new('resturant.txt')
guide.launch