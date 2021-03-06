defmodule TrackdogWeb.ResultLive.FormComponent do
  use TrackdogWeb, :live_component

  alias Trackdog.Events

  @impl true
  def update(%{result: result} = assigns, socket) do
    changeset = Events.change_result(result)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"result" => result_params}, socket) do
    changeset =
      socket.assigns.result
      |> Events.change_result(result_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"result" => result_params}, socket) do
    save_result(socket, socket.assigns.action, result_params)
  end

  defp save_result(socket, :edit, result_params) do
    case Events.update_result(socket.assigns.result, result_params) do
      {:ok, _result} ->
        {:noreply,
         socket
         |> put_flash(:info, "Result updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_result(socket, :new, result_params) do
    case Events.create_result(result_params) do
      {:ok, _result} ->
        {:noreply,
         socket
         |> put_flash(:info, "Result created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
