defmodule BikeShop.Repo do
  use Ecto.Repo,
    otp_app: :bike_shop,
    adapter: Ecto.Adapters.Postgres
end
