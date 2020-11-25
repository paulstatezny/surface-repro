defmodule SurfaceReproWeb.PageVanillaLive do
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

    <a class="block mt-16" href="/">Surface example</a>
    """
  end
end
