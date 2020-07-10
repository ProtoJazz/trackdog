defmodule TrackdogWeb.ResultLive.Index do
  use TrackdogWeb, :live_view

  alias Trackdog.Events
  alias Trackdog.Events.Result

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :results, list_results())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Result")
    |> assign(:result, Events.get_result!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Result")
    |> assign(:result, %Result{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Results")
    |> assign(:result, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    result = Events.get_result!(id)
    {:ok, _} = Events.delete_result(result)

    {:noreply, assign(socket, :results, list_results())}
  end

  defp list_results do
    Events.list_results()
  end
end
