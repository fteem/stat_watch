defmodule StatWatch do
  alias StatWatch.Youtube

  def run do
    Youtube.fetch_stats()
    |> save_csv()
  end

  def column_names do
    Enum.join(~w(DateTime Subscribers Videos Views), ",")
  end

  def save_csv(row) do
    filename = "stats.csv"

    unless File.exists?(filename) do
      File.write!(filename, column_names() <> "\n")
    end

    File.write!(filename, row <> "\n", [:append])
  end
end
