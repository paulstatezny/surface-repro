defmodule SurfaceReproWeb.PageLive do
  use SurfaceReproWeb, :live_view

  alias SurfaceReproWeb.{Tabs, Tabs.Tab}

  prop tab, :atom

  @impl true
  def mount(_params, _session, socket),
    do: {:ok, assign(socket, tab: :account)}

  @impl true
  def handle_event("tab_changed", %{"key" => key}, socket) do
    {:noreply, assign(socket, tab: String.to_existing_atom(key))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Tabs selected={{ @tab }} click="tab_changed">
      <Tab key={{ :account }} label="My Account" />
      <Tab key={{ :team }} label="My Team" />
      <Tab key={{ :billing }} label="Billing" />
      <Tab key={{ :company }} label="Company" />
    </Tabs>
    """
  end
end
