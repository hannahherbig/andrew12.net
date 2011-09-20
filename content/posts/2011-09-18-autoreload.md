---
title: autoreload.rb
created_at: 2011-09-18
---

Put this in any folder where you want files from there to be automatically reloaded, e.g. `lib`, then require this file.

<% code :ruby do %>
require 'fssm' # gem install fssm

Thread.abort_on_exception = true

Thread.new do
  FSSM.monitor(Dir.getwd), '**/*') do
    update do |b, r|
      fn = File.join(b, r)
      load fn
      puts "reloaded #{fn}"
    end

    create do |b, r|
      fn = File.join(b, r)
      load fn
      puts "loaded new file #{fn}"
    end
  end
end
<% end %>
