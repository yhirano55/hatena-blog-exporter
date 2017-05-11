require "rubygems"
require "bundler/setup"
Bundler.require

require "fileutils"
require "erb"

namespace :"hatena-blog-exporter" do
  desc "export entries for hugo markdown format"
  task :hugo do
    client = Hatenablog::Client.create
    erb    = File.read("templates/hugo.md.erb")
    feed   = nil

    FileUtils.mkdir('post')

    loop do
      feed = client.next_feed(feed)

      feed.each_entry do |entry|
        File.open("post/#{entry.id}.md", "w+") do |f|
          f.puts ERB.new(erb).result(binding)
          puts "created post/#{entry.id}.md"
        end
      end

      break unless feed.has_next?
    end
  end
end
