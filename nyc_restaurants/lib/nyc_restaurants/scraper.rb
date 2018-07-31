class NycRestaurants::Scraper

  BASE_URL = "https://www.tripsavvy.com/zagat-best-nyc-restaurants-4159763"

  @@all_reviews = []

  def self.scrape_restaurants
     doc = Nokogiri::HTML(open(BASE_URL))
     doc.css('.loc').css('h3').each do |restaurant|
       name = restaurant.children.text.strip
       NycRestaurants::Restaurants.new(name)
     end
  end


  def self.scrape_restaurant_details(index)
    doc = Nokogiri::HTML(open(BASE_URL))
    doc.css('.comp.inline-chop.ordered-list__content-description.text-passage').each do |description|
    review = description.children.text.strip
    @@all_reviews << review
   end
  @@all_reviews[index]
  end



end
