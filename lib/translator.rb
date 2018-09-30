require "yaml"
require "pry"

def load_library(lib)
  emoticons = YAML.load_file(lib) 
  new_lib = {"get_emoticon" => {}, "get_meaning" => {}}
  
  emoticons.each do |word, sym|
    new_lib["get_emoticon"][sym.first] = sym.last 
    new_lib["get_meaning"][sym.last] = word
  end 
 new_lib
end

# load_library("./lib/emoticons.yml")

def get_japanese_emoticon(lib, message)
  library = load_library(lib)
  sym = library["get_emoticon"][message]
   library.each do |key, val|
    return val if val.include?(message)
  end 
  return "Sorry, that emoticon was not found"
end

# def get_japanese_emoticon(path, emoticon)
#   emoticon_hash = load_library(path)
#   result = emoticon_hash["get_emoticon"][emoticon]
#   if result == nil
#     result = "Sorry, that emoticon was not found" 
#   end
#   result
# end

def get_english_meaning(lib, message)
  library = load_library(lib)
  library.each do |key, val|
    return key if val.include?(message)
  end 
  return "Sorry, that emoticon was not found"
end

# def get_english_meaning(path, emoticon)
#   emoticon_hash = load_library(path)
#   result = emoticon_hash["get_meaning"][emoticon]
#   if result == nil
#     result = "Sorry, that emoticon was not found" 
#   end
#   result
# end