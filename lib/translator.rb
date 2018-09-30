require "yaml"
require "pry"

def load_library(lib)
  emoticons = YAML.load_file(lib) 
  # new_lib = {}
  new_lib = { :get_meaning => {}, :get_emoticon => {}}
  
  new_lib["get_emoticon"][emoticon_set.first] = emoticon_set.last
#     emoticon_hash["get_meaning"][emoticon_set.last] = english_word
 
end

# def load_library(path)

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