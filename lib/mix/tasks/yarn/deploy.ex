defmodule Mix.Tasks.Yarn.Deploy do
  @moduledoc false
  use Mix.Task

  @shortdoc "Run yarn deploy within assets directory"

  def run(_) do
    "yarn"
    |> System.cmd(["deploy", "--color", "--silent"], into: IO.stream(:stdio, :line), cd: "assets")
    |> halt_on_error
  end

  defp halt_on_error({_, 0} = result), do: result

  defp halt_on_error({_, exit_code}) do
    Mix.raise("mix yarn failed with exit code #{exit_code}")
  end
end
