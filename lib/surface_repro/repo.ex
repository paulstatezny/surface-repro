defmodule SurfaceRepro.Repo do
  use Ecto.Repo,
    otp_app: :surface_repro,
    adapter: Ecto.Adapters.Postgres
end
