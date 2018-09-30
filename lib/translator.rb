require "yaml"
require "pry"

def load_library(lib)
  library = YAML.load_file(lib) 
  new_lib = { "get_meaning" => {}, "get_emoticon" => {}}
  library.each do |key, val|
    inside_hash = { val[-1] => key}
    new_lib.merge(new_lib["get_meaning"] = inside_hash)
    # puts new_lib["get_meaning"]
  end 
  puts new_lib.values
  new_lib
 
end

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