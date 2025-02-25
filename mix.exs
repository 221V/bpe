defmodule BPE.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bpe,
      version: "4.8.1",
      description: "BPE Process Engine",
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [mod: {:bpe_otp, []}, applications: [:rocksdb, :syn, :kvs]]
  end

  def package do
    [
      files: ~w(doc include lib src mix.exs LICENSE rebar.config),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :bpe,
      links: %{"GitHub" => "https://github.com/synrc/bpe"}
    ]
  end

  def deps do
    [
      {:ex_doc, "~> 0.11", only: :dev},
      {:rocksdb, "~> 1.2.0"},
      {:syn, "~> 1.6.3"},
      {:kvs, "~> 6.7.2"}
    ]
  end
end
