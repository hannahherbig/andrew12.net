# so that I can say "thor post" and it'll generate a post template for me.

require 'yaml'

class Post < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  def do_it
    title = ask("What is the post's title?")
    url_title = title.downcase.gsub(/[[:punct:]]/, '').gsub(/\s+/, "-")

    time      = Time.now
    date      = time.strftime("%F")
    filename  = "content/posts/#{date}-#{url_title}.md"
    time      = Time.at(time.to_i) # HACK to get rid of the milliseconds
    contents  = { "created_at" => time, "title" => title }.to_yaml + "---\n\n"
    contents += "Hello, world!\n"

    create_file(filename, contents)
  end
end
