require 'umruhren/version'
require 'set'

module Umruhren
  CHARS = %w( 0 1 2 3 4 5 6 7 8 9 a b c d e f )

  class << self
    def rename_files(dir, ext)
      files = Dir[dir + "/*.#{ext}"]
      new_names = rand_string_array(files.size)
      files.each_with_index do |f, i|
        File.rename(f, dir + "/" + new_names[i] + File.extname(f))
      end
    end

    private
    def rand_string(length = 12)
      (1..length).map{ CHARS.sample }.join
    end

    def rand_string_array(size)
      randoms = Set.new
      loop do
        randoms << rand_string
        return randoms.to_a if randoms.size >= size
      end
    end
  end
end
