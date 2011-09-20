# nanoc's Blogging helper is too compilcated for me, we're going to use this
# instead.

require 'time'

def posts
  @items.select do |item|
    item.identifier.include? 'posts'
  end.sort_by do |item|
    Time.parse(item[:created_at].to_s)
  end.reverse
end

def format_time(str)
  Time.parse(str.to_s).strftime("%a %b %d %Y")
end
