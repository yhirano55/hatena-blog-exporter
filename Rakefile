require "rubygems"
require "bundler/setup"
Bundler.require

require "fileutils"

namespace :"hatena-blog-exporter" do
  desc "export entries for hugo markdown format"
  task :hugo do
    client = Hatenablog::Client.create

    FileUtils.mkdir('post')
    feed = nil

    loop do
      feed = client.next_feed(feed)

      feed.each_entry do |entry|
        File.open("post/#{entry.id}.md", "w+") do |f|
          f.puts <<~EOS
          +++
          date        = "#{entry.updated.strftime('%Y-%m-%dT%H:%M:%S+09:00')}"
          title       = "#{entry.title}"
          description = "#{entry.title}"
          tags        = #{entry.categories.inspect}

          +++

          #{entry.content}
          EOS

          puts "created post/#{entry.id}.md"
        end
      end

      break unless feed.has_next?
    end
  end
end
