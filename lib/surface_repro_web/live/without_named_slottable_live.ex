defmodule SurfaceReproWeb.WithoutNamedSlottableLive do
  use SurfaceReproWeb, :surface_live_view

  alias SurfaceReproWeb.{
    TabsWithoutNamedSlottable,
    TabsWithoutNamedSlottable.Tab
  }

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
    <TabsWithoutNamedSlottable>
      <Tab click="tab_changed" selected={{ @tab == :account }} key={{ :account }} label="My Account" />
      <Tab click="tab_changed" selected={{ @tab == :team }} key={{ :team }} label="My Team" />
      <Tab click="tab_changed" selected={{ @tab == :billing }} key={{ :billing }} label="Billing" />
      <Tab click="tab_changed" selected={{ @tab == :company }} key={{ :company }} label="Company" />
    </TabsWithoutNamedSlottable>

    <p class="font-bold text-lg mt-16">Viewing: Example without named slottable</p>
    <a class="block underline" href="/vanilla">Vanilla LiveView example</a>
    <a class="block underline" href="/">Surface example</a>

    <p class="mt-16">Directions: Open websocket inspector and note which static vs dynamic bits are sent when you change the tab.</p>
    """
  end
end
