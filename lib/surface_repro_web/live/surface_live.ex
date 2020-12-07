defmodule SurfaceReproWeb.SurfaceLive do
  use SurfaceReproWeb, :surface_live_view

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

    <p class="font-bold text-lg mt-16">Viewing: Surface example</p>
    <a class="block underline" href="/without-typed-slotable">Surface example without typed slotables</a>
    <a class="block underline" href="/vanilla">Vanilla LiveView example</a>
    <a class="block underline" href="/vanilla-functions">Vanilla LiveView with Functions (no components)</a>

    <p class="mt-16">Directions: Open websocket inspector and note which static vs dynamic bits are sent when you change the tab.</p>
    """
  end
end
