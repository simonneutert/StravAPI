module SystemCalls
  class WebBrowser

    def self.open(url)
      ruby_host_os = RbConfig::CONFIG['host_os']
      if ruby_host_os =~ /mswin|mingw|cygwin/
        system "start '#{url}'"
      elsif ruby_host_os =~ /darwin/
        system "open '#{url}'"
      elsif ruby_host_os =~ /linux|bsd/
        system "xdg-open '#{url}'"
      else
        puts 'Operating System not supported, please copy and past the url above!'
      end
    end

  end
end
