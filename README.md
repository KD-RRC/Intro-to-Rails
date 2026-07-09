# Brew Finder

A Ruby on Rails web application for exploring craft breweries and beers, built for the Intro to Rails project. Brew Finder pulls together brewery, beer, and review data from three sources to power search, browsing, and mapping features.

## Data Sources

1. **Open Brewery DB API** (`api.openbrewerydb.org`) — real brewery data including name, type, location, and GPS coordinates. Includes a dedicated query for Canadian breweries alongside the general dataset.
2. **Craft Beers CSV** (public dataset) — 2,400+ real beers with name, style, ABV, and IBU.
3. **Faker gem** — generates users, reviews, and hop names, since no public API/dataset covers hops or user reviews for this data.

Since the API and CSV don't share keys, beers are linked to a random imported brewery at seed time. Styles are extracted from the CSV into their own table and linked by foreign key.

## Features

- Browse breweries and beers with full pagination
- Filter breweries by country
- Search beers by name and/or style
- View a brewery's location on an interactive map (Leaflet + OpenStreetMap)
- Navigate between beers, styles, and breweries via linked pages
- User reviews and ratings on each beer

## Tech Stack

- Ruby on Rails 8
- Bootstrap 5 (Sass pipeline via `yarn`/`nodemon`)
- SQLite (development)
- Kaminari for pagination
- Leaflet.js for mapping

## Setup

```bash
git clone https://github.com/KD-RRC/Intro-to-Rails.git
cd Intro-to-Rails
bundle install
yarn install
rails db:create db:migrate db:seed
```

Run the app with two processes:

```bash
# Terminal 1 — CSS build/watch
yarn watch:css

# Terminal 2 — Rails server
bin/rails server
```

Then visit `http://localhost:3000`.

## Entity Relationship Diagram

See the project's About page for the full data description and ERD.

## Khalil Depeazer

Built by KD-RRC for the Intro to Rails course project.