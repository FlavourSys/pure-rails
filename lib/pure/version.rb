module Pure
  module Rails
    VERSION = '0.5.0'

    def self.update_version(str)
      this = File.read(__FILE__)
      that = this.gsub(VERSION, str)
      File.open(__FILE__, 'w') { |fd| fd.write that }
    end
  end
end
