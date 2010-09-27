#!/usr/bin/env ruby

require "rubygems"
require "bluecloth"

ROOT   = File.dirname(__FILE__)
LAYOUT = File.open(File.join(ROOT, 'layout.html')).read
SLIDES = []

Dir[File.join(ROOT, "slides/*.md")].sort.each do |fname|
  SLIDES << BlueCloth.new(File.open(fname).read).to_html
end

puts LAYOUT.gsub("{{ content }}", SLIDES.join("<hr />"))
