require "open-uri"
require "json"
require "csv"

puts "Clearing old data..."
BeerHop.destroy_all
Review.destroy_all
Beer.destroy_all
Hop.destroy_all
User.destroy_all
Style.destroy_all
Brewery.destroy_all

# ── Source 1: Open Brewery DB API ────────────────────────────────
puts "Importing breweries from Open Brewery DB API..."

def import_breweries(url)
  JSON.parse(URI.open(url).read).each do |b|
    Brewery.create(
      name: b["name"],
      brewery_type: b["brewery_type"],
      city: b["city"],
      state_province: b["state_province"],
      country: b["country"],
      latitude: b["latitude"],
      longitude: b["longitude"],
      website_url: b["website_url"]
    )
  end
end

# General mix (mostly US/international, per_page max is 200)
import_breweries("https://api.openbrewerydb.org/v1/breweries?per_page=200")

# Dedicated Canadian pull, so Manitoba/Canada actually shows up
import_breweries("https://api.openbrewerydb.org/v1/breweries?by_country=canada&per_page=200")

puts "  #{Brewery.count} breweries created."

# ── Source 2: Craft Beers CSV ────────────────────────────────────
puts "Importing beers and styles from CSV..."
brewery_ids = Brewery.pluck(:id)
csv = CSV.read(Rails.root.join("db/data/beers.csv"), headers: true, encoding: "bom|utf-8")

csv.each do |row|
  next if row["name"].blank? || row["style"].blank?
  style = Style.find_or_create_by(name: row["style"].strip)
  Beer.create(
    name: row["name"],
    abv: row["abv"],
    ibu: row["ibu"],
    style: style,
    brewery_id: brewery_ids.sample
  )
end
puts "  #{Beer.count} beers, #{Style.count} styles created."

# ── Source 3: Faker ──────────────────────────────────────────────
puts "Generating hops, users, and reviews with Faker..."
hops = 20.times.map { Hop.find_or_create_by(name: Faker::Beer.unique.hop) }
Beer.find_each { |beer| beer.hops = hops.sample(rand(1..3)) }

users = 50.times.map do
  User.create(username: Faker::Internet.unique.username, email: Faker::Internet.unique.email)
end

300.times do
  Review.create(
    user: users.sample,
    beer: Beer.order("RANDOM()").first,
    rating: rand(1..5),
    body: Faker::Lorem.paragraph(sentence_count: 2)
  )
end

puts "Done! Total rows: #{Brewery.count + Style.count + Beer.count + User.count + Review.count + Hop.count + BeerHop.count}"