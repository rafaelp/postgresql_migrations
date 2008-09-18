require 'rubygems'
%w[activerecord postgres].each do |req_gem|
  begin
    require req_gem
  rescue LoadError
    puts "This Rakefile requires the '#{req_gem}' RubyGem."
    puts "Installation: gem install #{req_gem} -y"
    exit
  end
end

require 'active_record/connection_adapters/postgresql_adapter'

$:.unshift(File.join(File.dirname(__FILE__), %w[.. lib]))
