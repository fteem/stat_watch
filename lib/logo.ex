defmodule StatWatch.Logo do
  @api_url "https://logo.clearbit.com"

  def fetch_logo(domain_name) do
    domain_name
    |> logo_url
    |> HTTPoison.get!()
    |> extract_logo
  end

  def extract_logo(%{status_code: 200, request_url: url}), do: url
  def extract_logo(%{status_code: 404}), do: "Not found"
  def extract_logo(_), do: "Something went wrong"

  def logo_url(domain_name) do
    "#{@api_url}/#{domain_name}"
  end
end
