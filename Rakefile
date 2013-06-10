#!/usr/bin/env rake

require 'bundler'
require 'bundler/gem_tasks'

Bundler::GemHelper.install_tasks

namespace :pure do
  desc 'Update the contained Pure version and our own version number'
  task :update do
    require 'httparty'
    require 'pure/version'
    require 'fileutils'

    # Determine most recent Pure version.
    resp = HTTParty.get 'http://purecss.io/'
    raise 'failed to fetch http://purecss.io/index.html' unless resp.code == 200
    if m = /(http:\/\/yui\.yahooapis\.com\/pure\/(\d.\d.\d)\/pure\-min\.css)/.match(resp.body)
      url = m.captures[0]
      version = m.captures[1]
    else
      raise 'could not find link to pure-min.css in http://purecss.io/index.html'
    end

    if Pure::Rails::VERSION != version
      # Download new version.
      resp = HTTParty.get url
      raise "failed to fetch #{url}" unless resp.code == 200
      
      # Delete old version.
      asset = File.join(File.dirname(__FILE__), 'vendor/assets/stylesheets/pure-min.css')
      FileUtils.rm(asset)
      
      # Write new version.
      File.open(asset, 'w') { |fd| fd.write(resp.body) }

      # Update version number.
      Pure::Rails.update_version version

      puts "Updated to version #{version}."
    else
      puts 'Already up to date.'
    end    
  end
end
