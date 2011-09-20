# format code using albino (a wrapper for pygments)

include Nanoc3::Helpers::Capturing

require 'albino'

def code(lang, &block)
  # Capture block
  data = capture(&block)

  # Remove whitespace
  lines = data.split("\n")
  min_indent = lines.inject(nil) do |memo, line|
    next memo if line =~ /^\s*$/
    next memo if line !~ /^(\s*)/
    [memo, $1.size].compact.min
  end

  lines.each do |line|
    line[0, min_indent] = ''
  end

  data = lines.join("\n")

  # Filter captured data
  filtered_data = Albino.colorize(data, lang).strip

  # Add missing <code> in <pre>
  filtered_data.sub!(%r!<pre>.+</pre>!) { |m| "<code>#{m}</code>" }

  # Append filtered data to buffer
  buffer = eval('_erbout', block.binding)
  buffer << filtered_data
end
