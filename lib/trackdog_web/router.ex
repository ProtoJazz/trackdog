defmodule TrackdogWeb.Router do
  use TrackdogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TrackdogWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TrackdogWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/results", ResultLive.Index, :index
    live "/results/new", ResultLive.Index, :new
    live "/results/:id/edit", ResultLive.Index, :edit

    live "/results/:id", ResultLive.Show, :show
    live "/results/:id/show/edit", ResultLive.Show, :edit

    live "/result_entries", ResultEntryLive.Index, :index
    live "/result_entries/new", ResultEntryLive.Index, :new
    live "/result_entries/:id/edit", ResultEntryLive.Index, :edit

    live "/result_entries/:id", ResultEntryLive.Show, :show
    live "/result_entries/:id/show/edit", ResultEntryLive.Show, :edit

    live "/events", EventLive.Index, :index
    live "/events/new", EventLive.Index, :new
    live "/events/:id/edit", EventLive.Index, :edit

    live "/events/:id", EventLive.Show, :show
    live "/events/:id/show/edit", EventLive.Show, :edit
  end

  scope "/auth", TrackdogWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end



  # Other scopes may use custom stacks.
  # scope "/api", TrackdogWeb do
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
      live_dashboard "/dashboard", metrics: TrackdogWeb.Telemetry
    end
  end
end
