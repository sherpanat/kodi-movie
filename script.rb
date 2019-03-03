require 'json'

root = "Films/Comédie/"
all_files = IO.popen("cd #{root} ; ls")

movies = all_files.select do |file|
  file.include?('.')
end
movies.map! { |movie| movie[0..-2] }

pattern = /^(?<movie>.+)\..+$/

movies.each do |movie|
  match_data = movie.match(pattern)
  movie_name = match_data[:movie]
  file_name = movie.gsub(/\s/, "_")
  folder_name = movie_name.gsub(/\s/, "_")
  `mkdir #{root}#{folder_name}`
end