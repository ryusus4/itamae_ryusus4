require './modules/file_line_addable.rb'

USER = node['user']

add_file_line(path: ".dummy", user: USER, line: "status --is-interactive; and source (rbenv init -|psub)")
