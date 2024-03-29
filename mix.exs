defmodule StatWatch.MixProject do
  use Mix.Project

  def project do
    [
      app: :stat_watch,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StatWatch.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:poison, "~> 4.0"},
      {:postgrex, "~> 0.15.1"},
      {:ecto, "~> 3.2"}
    ]
  end
end
