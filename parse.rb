require 'bundler/setup'
require 'nokogiri'
require 'json'
require 'pry'

path = 'word/footnotes.xml'
`./download.sh` if !File.exist?(path)
f = File.open(path)
doc = Nokogiri::XML(f)

footnotes = doc.children[0].children[3..-1]

my_footnotes = footnotes.to_ary.map do |fn|
  {
    value: fn.attributes['id'].value.to_i - 1,
    text: fn.text.strip
  }
end

#STDOUT.puts JSON.generate my_footnotes

filers = [
  "Comcast",
  "AT&T",
  "Verizon",
  "CTIA",
  "Free Press",
  "Public Knowledge",
  "New America",
  "Pendleton"
]

filers.map! do |filer|
  {
    filer: filer,
    count: my_footnotes.select {|fn| fn[:text].include?(filer)}.length
  }
end

binding.pry

f.close
