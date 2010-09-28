#!/usr/bin/env ruby

require "rubygems"
require "bluecloth"

ROOT     = File.dirname(__FILE__)
@@layout = File.open(File.join(ROOT, 'layout.html')).read
@@slides = []

Dir[File.join(ROOT, "slides/*.md")].sort.each do |fname|
  @@slides << BlueCloth.new(File.open(fname).read).to_html
end

puts @@layout.gsub("{{ content }}", @@slides.join("<hr />"))
