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

@@slides_html = @@layout.gsub("{{ content }}", @@slides.join)

File.open(ARGV[0] || "slides.html", "w+"){|f| f.write(@@slides_html)}

puts @@slides_html
