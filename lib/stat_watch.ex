defmodule StatWatch do
  alias StatWatch.CSV
  alias StatWatch.Logo
  alias StatWatch.Youtube
  alias StatWatch.Twitter

  @alchemist %{
    channel_id: "UCp5Nix6mJCoLkH_GqcRRp1A",
    twitter: "alchemistcamp",
    domain_name: "alchemist.camp"
  }

  def run do
    fetch_stats(@alchemist)
    |> CSV.save_csv()
  end

  def fetch_stats(entity) do
    [
      Youtube.fetch_stats(entity.channel_id),
      Twitter.fetch_stats(entity.twitter),
      Logo.fetch_logo(entity.domain_name)
    ]
    |> Enum.join(",")
  end
end
