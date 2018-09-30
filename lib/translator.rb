require "yaml"
require "pry"

def load_library(lib)
  emoticon = YAML.load_file(lib) 
  new_lib = {}
  
  new_lib = { "get_meaning" => {}, "get_emoticon" => {}}
  library.each do |key, val|
    inside_hash = { val[-1] => key}
    new_lib.merge(new_lib["get_meaning"] = inside_hash)
    # puts new_lib["get_meaning"]
  end 
  puts new_lib.values
  new_lib
 
end

# def load_library(path)
#   emoticons = YAML.load_file(path)
#   emoticon_hash = Hash.new

#   emoticon_hash["get_emoticon"] = Hash.new
#   emoticon_hash["get_meaning"] = Hash.new

#   emoticons.each do |english_word, emoticon_set|
#     emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
#     emoticon_hash["get_meaning"][emoticon_set.last] = english_word
#   end
#   emoticon_hash
# end



load_library("./lib/emoticons.yml")

def get_japanese_emoticon(lib, message)
  library = load_library(lib)
   library.each do |key, val|
    return val if val.include?(message)
  end 
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(lib, message)
  library = load_library(lib)
  library.each do |key, val|
    return key if val.include?(message)
  end 
  return "Sorry, that emoticon was not found"
end