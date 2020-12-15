defmodule EctoHooks.MixProject do
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :ecto_hooks,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirrc_options: [warnings_as_errors: true],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ],
      package: package(),
      description: description(),
      source_url: "https://github.com/vereis/build_you_a_telemetry"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Lint dependencies
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},

      # Test dependencies
      {:etso, "~> 0.1.2", only: :test},

      # Misc dependencies
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [lint: ["format --check-formatted --dry-run", "credo --strict", "dialyzer"]]
  end

  defp description() do
    """
    Extends `Ecto.Repo` callbacks to provide user implementable hooks for given `Ecto.Schema`
    implementations.

    See project `README.md` for more details
    """
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/vereis/ecto_hooks"
      }
    ]
  end
end
