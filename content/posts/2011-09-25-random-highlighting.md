--- 
created_at: Sun Sep 25 23:39:42 EDT 2011
title: Random Highlighting
---

Look at the code!  I wrote something that will randomly get a random Pygments
CSS theme whenever you load this page.  If you don't like a theme, refresh the
page and it will change.  Here's some code [from rhuidean][example] for you 
to look at, to play around with it.

[example]: https://github.com/rakaur/rhuidean/blob/master/EXAMPLE.md

<% code :ruby do %>
client = IRC::Client.new do |c|
    c.server   = "irc.example.com"
    c.port     = 6667
    c.password = "optional_password"

    c.nickname = "rhuidean-bot"
    c.username = "rhuidean"
    c.realname = "built by the Jenn Aiel"

    # These provide basic logging. Debug shows all network traffic.
    # Logger can be set to false to turn off logging.
    # Log level is one of :fatal, :error, :warning, :info, :debug
    c.logger       = Logger.new($stdout)
    c.log_level    = :info
end
<% end %>

**EDIT**: Nevermind, that was a really bad idea for a few different reasons...