# 1. indent all the code properly
# 2. #main_menu made into smaller components
## any single method should only do one thing
# 3. One instance of turning a conditional in inverse (i.e. instead of ==, !=)

class NycRestaurants::CLI

  def start
    puts "Welcome to NYC Restaurants"
    puts ""
    NycRestaurants::Scraper.scrape_restaurants
    main_menu
  end

  def main_menu
    puts "Here are all the restaurants that are reviewed"
      restaurants = NycRestaurants::Restaurants.all
      restaurants.each.with_index(1) do |restaurant, index|
        puts "#{index}. #{restaurant.name}"
      end
    puts ""
    puts "Please select a restaurant to view additional details:"
    puts "You can type exit at any time to quit the program"
    input
  end

  def input
    input = gets.strip
      if input == "exit"
        exit
      elsif input.to_i > NycRestaurants::Restaurants.all.length ||
        !input.to_i || input.to_i == 0
        puts "Invalid Selection"
        puts ""
        main_menu
      else
        index = input.to_i - 1
        call_scraper(index)
      end
  end

  def call_scraper(index)
    restaurant = NycRestaurants::Restaurants.all[index]
    NycRestaurants::Scraper.scrape_restaurant_details(index)
    puts "Here are the details:"
    puts  NycRestaurants::Scraper.scrape_restaurant_details(index)
    puts ""
    main_menu
  end

end
