require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper


  def get_page

    page = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    return page
  end

  def get_courses
    binding.pry
    return self.get_page.css(".post")

  end

  def make_courses
    self.get_courses.each do |h|
      #binding.pry
      course = Course.new
      course.title = h.css("h2").text
      course.schedule = h.css(".date").text
      course.description = h.css("p").text
      binding.pry
    end

  end





    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
