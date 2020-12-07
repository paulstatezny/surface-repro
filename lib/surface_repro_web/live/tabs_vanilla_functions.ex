defmodule SurfaceReproWeb.TabsVanillaFunctions do
  import Phoenix.LiveView.Helpers, only: [sigil_L: 2]

  def render(assigns) do
    ~L"""
    <div class="border-b border-gray-200">
      <nav class="flex -mb-px">
        <%= for {key, label} <- @tabs do %>
          <%= tab(%{click: @click, key: key, label: label, selected: @selected}) %>
        <% end %>
      </nav>
    </div>
    """
  end

  defp tab(assigns) do
    ~L"""
    <button type="button" phx-click="<%= @click %>" phx-value-key="<%= @key %>" class="<%= class(@selected == @key) %>">
      <span><%= @label %></span>
    </button>
    """
  end

  @base_classes "ml-8 first:ml-0 py-4 px-1 border-b-2 "

  defp class(true = _selected), do: @base_classes <> "text-red-600 border-red-500 bg-red-100"

  defp class(false = _selected),
    do: @base_classes <> "text-gray-500 border-transparent hover:border-gray-300"
end
