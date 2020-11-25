defmodule SurfaceReproWeb.TabsWithoutNamedSlottable do
  use Surface.Component

  defmodule Tab do
    use Surface.Component

    prop key, :atom, required: true
    prop label, :string, required: true
    prop selected, :boolean, required: true
    prop click, :event, required: true

    def render(assigns) do
      ~H"""
      <button type="button" :on-click={{ @click }} phx-value-key={{ @key }} class={{
        "ml-8 first:ml-0 py-4 px-1 border-b-2",
        "text-red-600 border-red-500 bg-red-100": @selected,
        "text-gray-500 border-transparent hover:border-gray-300": not @selected
      }}>
        <span>{{ @label }}</span>
      </button>
      """
    end
  end

  def render(assigns) do
    ~H"""
    <div class="border-b border-gray-200">
      <nav class="flex -mb-px">
        <slot/>
      </nav>
    </div>
    """
  end
end
