defmodule SurfaceReproWeb.Router do
  use SurfaceReproWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SurfaceReproWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SurfaceReproWeb do
    pipe_through :browser

    live "/", SurfaceLive, :index
    live "/vanilla", VanillaLive, :index
    live "/vanilla-functions", VanillaFunctionsLive, :index
    live "/without-typed-slotable", WithoutTypedSlotableLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SurfaceReproWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SurfaceReproWeb.Telemetry
    end
  end
end
