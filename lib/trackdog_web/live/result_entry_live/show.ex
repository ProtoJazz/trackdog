defmodule TrackdogWeb.ResultEntryLive.Show do
  use TrackdogWeb, :live_view

  alias Trackdog.Events

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:result_entry, Events.get_result_entry!(id))}
  end

  defp page_title(:show), do: "Show Result entry"
  defp page_title(:edit), do: "Edit Result entry"
end
