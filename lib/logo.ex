defmodule StatWatch.Logo do
  @api_url "https://logo.clearbit.com"

  def fetch_logo do
    logo_url()
    |> HTTPoison.get!()
    |> extract_logo
  end

  def extract_logo(%{status_code: 200, request_url: url}), do: url
  def extract_logo(%{status_code: 404}), do: "Not found"
  def extract_logo(_), do: "Something went wrong"

  def logo_url do
    "#{@api_url}/alchemist.camp"
  end
end
