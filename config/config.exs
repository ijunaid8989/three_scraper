# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :three_scraper,
  username: System.get_env("THREE_USERNAME"),
  password: System.get_env("THREE_PASSWORD"),
  ecto_repos: [ThreeScraper.Repo]

config :three_scraper, ThreeScraper.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "three_scraper_dev"
