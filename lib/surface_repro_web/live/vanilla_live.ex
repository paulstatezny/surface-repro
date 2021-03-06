defmodule SurfaceReproWeb.VanillaLive do
  use SurfaceReproWeb, :live_view

  @impl true
  def mount(_params, _session, socket),
    do: {:ok, assign(socket, tab: :account)}

  @impl true
  def handle_event("tab_changed", %{"key" => key}, socket) do
    {:noreply, assign(socket, tab: String.to_existing_atom(key))}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <%= live_component(@socket, SurfaceReproWeb.TabsVanilla, click: "tab_changed", selected: @tab, tabs: [
      {:account, "My Account"},
      {:team, "My Team"},
      {:billing, "Billing"},
      {:company, "Company"}
    ]) %>

    <a class="block underline mt-16" href="/">Surface example</a>
    <a class="block underline" href="/without-typed-slotable">Surface example without typed slotables</a>
    <p class="font-bold text-lg">Viewing: Vanilla LiveView example</p>
    <a class="block underline" href="/vanilla-functions">Vanilla LiveView with Functions (no components)</a>

    <p class="mt-16">Directions: Open websocket inspector and note which static vs dynamic bits are sent when you change the tab.</p>
    """
  end
end
