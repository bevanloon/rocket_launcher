defmodule Solar.Flare do

  defstruct [
    classification: :M,
    scale: 0,
    power: 0,
    is_deadly: false,
    date: nil
  ]

  def load(flares) do
    Enum.map flares, fn(flare) ->
      power = power(flare)
      deadly = power > 1000
      %{flare | power: power, is_deadly: deadly}
    end
  end

  def load_flares_comp(flares) do
    for flare <- flares,
      power <- [power(flare)],
      is_deadly <- [power > 1000],
      do: %{flare | power: power, is_deadly: is_deadly}

  end

  def power(%{classification: :X, scale: s}) do
    power(1000, s)
  end

  def power(%{classification: :M, scale: s}) do
    power(10, s)
  end

  def power(%{classification: :C, scale: s}) do
    power(1, s)
  end

  def no_eva(flares) do
    Enum.filter flares, fn (flare) ->
      power(flare) > 1000
    end
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.max
  end

  def total_flare_power(flares) do
    for flare <- flares,
      power <- [power(flare)],
      is_deadly <- [power > 1000],
      do: %{power: power, is_deadly: is_deadly}
    |> Enum.sum
  end

  def flare_list(flares) do
    Enum.map flares, fn(flare) ->
      p = power(flare)
      %{power: p, is_deadly: p > 1000}
    end
  end

  defp power(classification, scale) do
    classification * scale
  end
end
