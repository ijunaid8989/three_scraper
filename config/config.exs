# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :three_scraper,
  username: System.get_env("THREE_USERNAME"),
  password: System.get_env("THREE_PASSWORD")
