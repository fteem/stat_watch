defmodule StatWatch.Youtube do
  @api_url "https://www.googleapis.com/youtube/v3/channels"
  @yt_api_key System.get_env("API_KEY_YOUTUBE")

  def fetch_stats(channel_id) do
    now = DateTime.to_string(%{DateTime.utc_now() | microsecond: {0, 0}})

    %{body: body} =
      channel_id
      |> stat_url
      |> HTTPoison.get!()

    %{items: [%{statistics: stats} | _]} = Poison.decode!(body, keys: :atoms)

    [
      now,
      stats.subscriberCount,
      stats.videoCount,
      stats.viewCount
    ]
    |> Enum.join(",")
  end

  defp stat_url(channel_id) do
    part = "statistics"

    "#{@api_url}?id=#{channel_id}&key=#{@yt_api_key}&part=#{part}"
  end
end
