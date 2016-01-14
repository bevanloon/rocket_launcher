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
      flare
        |> calculate_power
        |> calculate_deadliness
    end
  end

  def load_flares_comp(flares) do
    for flare <- flares,
      power <- [calculate_power(flare)],
      is_deadly <- [calculate_deadliness(power)],
      do: is_deadly

    # for flare <- flares,
    #   power <- [power(flare)],
    #   is_deadly <- [power > 1000],
    #   do: %{flare | power: power, is_deadly: is_deadly}

  end

  def calculate_power(flare) do
    factor = case flare.classification do
      :M -> 10
      :X -> 1000
      :C -> 1
    end
    %{flare | power: flare.scale * factor}
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

  def calculate_deadliness(flare) do
      %{flare | is_deadly: flare.power > 1000}
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
