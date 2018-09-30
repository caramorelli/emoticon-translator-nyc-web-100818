require "yaml"
require "pry"

def load_library(lib)
  emoticons = YAML.load_file(lib) 
  new_lib = {}
  
  emoticons.each do |word, sym|
    new_lib["get_emoticon"][sym.first] = sym.last 
    new_lib["get_meaning"][sym.last] = word
  end 
  
  new_lib["get_emoticon"][emoticon_set.first] = emoticon_set.last
emoticon_hash["get_meaning"][emoticon_set.last] = english_word
 
end

# load_library("./lib/emoticons.yml")

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