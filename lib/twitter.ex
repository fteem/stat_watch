defmodule StatWatch.Twitter do
  @api_url "https://cdn.syndication.twimg.com"

  def fetch_stats(username) do
    username
    |> stat_url
    |> HTTPoison.get!()
    |> parse_response
  end

  def parse_response(%{status_code: 200, body: "[]"}), do: 0

  def parse_response(%{status_code: 200, body: body}) do
    [%{followers_count: count}] = Poison.decode!(body, keys: :atoms)
    count
  end

  def parse_response(_), do: 0

  def stat_url(username) do
    endpoint = "/widgets/followbutton/info.json"
    "#{@api_url}/#{endpoint}?screen_names=#{username}"
  end
end
