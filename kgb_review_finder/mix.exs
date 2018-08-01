defmodule KgbReviewFinder.MixProject do
  use Mix.Project

  def project do
    [
      app: :kgb_review_finder,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {KgbReviewFinder.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:google_language_client, path: "../google_language_client"},
      {:dealer_scraper, path: "../dealer_scraper"},
      {:veritaserum, git: "https://github.com/MrDoops/veritaserum.git"},
    ]
  end
end
