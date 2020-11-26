#!/usr/bin/ruby

# TODO support RAW and HEIC
# TODO scan for filetypes?

require 'date'
require 'exifr/jpeg'
require 'fileutils'

files_processed = 0

Dir.glob('*/*/*') do |file|
  puts "File: #{file}"
  file_type = `file --brief --mime-type '#{file}'`.chomp
  puts "File Type: #{file_type}"


  if file_type.include?('jpeg')
    jpeg = EXIFR::JPEG.new(file)
    if jpeg.exif? and jpeg.date_time
      exif_date = jpeg.date_time
      puts "EXIF Date: #{exif_date}"

      date      = exif_date.strftime("%Y-%m-%d")
      date_time = exif_date.strftime("%Y-%m-%d-%H-%M-%S%z")
      file_name = "#{date_time}.jpg"

      Dir.mkdir(date) unless File.exists?(date)

      dest_file_path = "./#{date}/#{file_name}"

      if File.exists?(dest_file_path)
        file_name = "#{date_time}-duplicate-#{files_processed}.jpg"
        dest_file_path = "./#{date}/#{file_name}"
      end

      FileUtils.mv(file, dest_file_path) unless File.exists?(dest_file_path)
    end

    puts "Wrote: #{dest_file_path}"
    files_processed += 1

    puts "Done: #{files_processed}"
  end
  puts
end
