defmodule StatWatch do
  alias StatWatch.CSV
  alias StatWatch.Logo
  alias StatWatch.Youtube

  def run do
    [
      Youtube.fetch_stats(),
      Logo.fetch_logo()
    ]
    |> Enum.join(",")
    |> CSV.save_csv()
  end
end
