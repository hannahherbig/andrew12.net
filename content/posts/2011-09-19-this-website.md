---
title: This website
created_at: 2011-09-19
---

Oh hi, you seem to have found my site.  I wrote it with [nanoc][] after stealing [ozmm][]'s CSS.  I started working on it a few days ago, and here it is.

I plan on using it to post things from code snippets, entire projects that I'm working on, pictures, cool websites I find, cool ruby stuff I find, cool stuff, like nanoc, that I find... It could be anything.  I've already added a few posts below (mainly because of when I was testing this) from my [tumblr][].

The code for this site is on [github][], and I'll be pushing to github whenever I push to my site.

I didn't use any fancy blogging helpers (i.e. `Nanoc3::Helpers::Blogging`), but instead I wrote my own helper methods:

<% code :ruby do %>
# nanoc's Blogging helper is too compilcated for me, we're going to
# use this instead.

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
<% end %>

There's also a `code` method so I can do something like this:

    <%% code :ruby do %%>
    puts "when I grow up I want to be printed"
    <%% end %%>

and get this:

<% code :ruby do %>
puts "when I grow up I want to be printed"
<% end %>

Cool, huh?

I might change the style at some point.  But for right now, it's a starting 
point, so I'm going to leave it.

[nanoc]: http://nanoc.stoneship.org/
[ozmm]: http://ozmm.org/
[github]: http://github.com/andrew12/andrew12.net
[tumblr]: http://andrew12.tumblr.com
