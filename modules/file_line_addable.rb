def add_file_line(path:, user: nil, line:)
  if user.nil?
    file path do
      action :create
      not_if "find #{path}"

      content ""
    end

    file path do
      action :edit
      block do |content|
        if content.empty?
          content << line
        elsif !content.include?(line)
          content << "\n" unless content[content.length - 1] == "\n"
          content << "#{line}"
        end
      end
    end
  else
    file path do
      action :create
      user user
      not_if "find #{path}"

      content ""
    end

    file path do
      action :edit
      user user
      block do |content|
        if content.empty?
          content << line
        elsif !content.include?(line)
          content << "\n" unless content[content.length - 1] == "\n"
          content << "#{line}"
        end
      end
    end
  end
end
