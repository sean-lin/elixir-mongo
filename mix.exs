defmodule Mongo.Mixfile do
  use Mix.Project

  def project do
    [ app: :mongo,
      name: "mongo",
      version: "0.2.0",
      source_url: "https://github.com/sean-lin/elixir-mongo",
      deps: deps(Mix.env),
      docs: &docs/0 ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:bson],
      env: [host: {"127.0.0.1", 27017}]
    ]
  end
  
  # Returns the list of dependencies for prod
  defp deps(:prod) do
    [
      {:bson, github: "sean-lin/elixir-bson"}
    ]
  end

  # Returns the list of dependencies for docs
  defp deps(:docs) do
    deps(:prod) ++
      [{ :ex_doc, github: "elixir-lang/ex_doc" }]
  end
  defp deps(_), do: deps(:prod)

  defp docs do
    [ 
      #readme: false,
      #main: "README",
    ]
  end

end
