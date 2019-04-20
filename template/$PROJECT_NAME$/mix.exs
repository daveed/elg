defmodule <%= @project_name_camel_case %>.Mixfile do
  use Mix.Project

  @name    :<%= @project_name %>
  @version "0.1.0"

  @deps [
    {:excit, "~> 0.1.0"},
    {:ex_doc, "~> 0.16", only: :dev, runtime: false}
  ]

  @maintainers ["Your Name"]
  @github      "https://github.com/•••/<%= @project_name %>"

  @description """
  What your template does (less than 300 characters)
  """

  def project do
    in_production = Mix.env == :prod
    [
      app:     @name,
      version: @version,
      deps:    @deps,
      elixir:  ">= <%= @elixir_version %>",
      elixirc_paths: elixirc_paths(Mix.env),
      aliases: aliases(),
      docs: docs(),
      package: package(),
      description: @description,
      build_embedded:  in_production,
      test_coverage: test_coverage(),
      preferred_cli_env: preferred_cli_env()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: @maintainers,
      licenses: ["MIT"],
      links: %{"GitHub" => @github}
    ]
  end

  defp docs do
    [
      name: @name,
      source_url: @github,
      homepage_url: "#",
      assets: "doc/assets",
      main: @name,
      extras: ["README.md"]
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp test_coverage do
    [
      tool: ExCoveralls
    ]
  end

  defp preferred_cli_env do
    [
      "coveralls": :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test
    ]
  end
end
