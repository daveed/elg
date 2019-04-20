defmodule Elg do
  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))

  use MixTemplates,
    name:       :elg,
    short_desc: "Template for Elixir Libraries",
    source_dir: "../template",
    based_on: :project
end
