defmodule Trackdog.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Trackdog.Repo

  alias Trackdog.Events.Result

  @doc """
  Returns the list of results.

  ## Examples

      iex> list_results()
      [%Result{}, ...]

  """
  def list_results do
    Repo.all(Result)
  end

  @doc """
  Gets a single result.

  Raises `Ecto.NoResultsError` if the Result does not exist.

  ## Examples

      iex> get_result!(123)
      %Result{}

      iex> get_result!(456)
      ** (Ecto.NoResultsError)

  """
  def get_result!(id), do: Repo.get!(Result, id)

  @doc """
  Creates a result.

  ## Examples

      iex> create_result(%{field: value})
      {:ok, %Result{}}

      iex> create_result(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_result(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a result.

  ## Examples

      iex> update_result(result, %{field: new_value})
      {:ok, %Result{}}

      iex> update_result(result, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_result(%Result{} = result, attrs) do
    result
    |> Result.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a result.

  ## Examples

      iex> delete_result(result)
      {:ok, %Result{}}

      iex> delete_result(result)
      {:error, %Ecto.Changeset{}}

  """
  def delete_result(%Result{} = result) do
    Repo.delete(result)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking result changes.

  ## Examples

      iex> change_result(result)
      %Ecto.Changeset{data: %Result{}}

  """
  def change_result(%Result{} = result, attrs \\ %{}) do
    Result.changeset(result, attrs)
  end

  alias Trackdog.Events.ResultEntry

  @doc """
  Returns the list of result_entries.

  ## Examples

      iex> list_result_entries()
      [%ResultEntry{}, ...]

  """
  def list_result_entries do
    Repo.all(ResultEntry)
  end

  @doc """
  Gets a single result_entry.

  Raises `Ecto.NoResultsError` if the Result entry does not exist.

  ## Examples

      iex> get_result_entry!(123)
      %ResultEntry{}

      iex> get_result_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_result_entry!(id), do: Repo.get!(ResultEntry, id)

  @doc """
  Creates a result_entry.

  ## Examples

      iex> create_result_entry(%{field: value})
      {:ok, %ResultEntry{}}

      iex> create_result_entry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_result_entry(attrs \\ %{}) do
    %ResultEntry{}
    |> ResultEntry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a result_entry.

  ## Examples

      iex> update_result_entry(result_entry, %{field: new_value})
      {:ok, %ResultEntry{}}

      iex> update_result_entry(result_entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_result_entry(%ResultEntry{} = result_entry, attrs) do
    result_entry
    |> ResultEntry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a result_entry.

  ## Examples

      iex> delete_result_entry(result_entry)
      {:ok, %ResultEntry{}}

      iex> delete_result_entry(result_entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_result_entry(%ResultEntry{} = result_entry) do
    Repo.delete(result_entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking result_entry changes.

  ## Examples

      iex> change_result_entry(result_entry)
      %Ecto.Changeset{data: %ResultEntry{}}

  """
  def change_result_entry(%ResultEntry{} = result_entry, attrs \\ %{}) do
    ResultEntry.changeset(result_entry, attrs)
  end

  alias Trackdog.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{data: %Event{}}

  """
  def change_event(%Event{} = event, attrs \\ %{}) do
    Event.changeset(event, attrs)
  end
end
