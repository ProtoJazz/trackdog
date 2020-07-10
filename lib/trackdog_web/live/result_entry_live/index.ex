defmodule TrackdogWeb.ResultEntryLive.Index do
  use TrackdogWeb, :live_view

  alias Trackdog.Events
  alias Trackdog.Events.ResultEntry

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :result_entries, list_result_entries())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Result entry")
    |> assign(:result_entry, Events.get_result_entry!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Result entry")
    |> assign(:result_entry, %ResultEntry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Result entries")
    |> assign(:result_entry, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    result_entry = Events.get_result_entry!(id)
    {:ok, _} = Events.delete_result_entry(result_entry)

    {:noreply, assign(socket, :result_entries, list_result_entries())}
  end

  defp list_result_entries do
    Events.list_result_entries()
  end
end
