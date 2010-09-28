#!/usr/bin/env ruby

require "rubygems"
require "bluecloth"

ROOT     = File.dirname(__FILE__)
@@layout = File.open(File.join(ROOT, 'layout.html')).read
@@slides = []

Dir[File.join(ROOT, "slides/*.md")].sort.each_with_index do |fname, i|
  @@slides << "<hr id='slide-#{i}' />" unless i == 0
  @@slides << BlueCloth.new(File.open(fname).read).to_html
end

puts @@layout.gsub("{{ content }}", @@slides.join)
