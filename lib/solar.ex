defmodule Solar do

  def power(%{classification: :X, scale: s}) do
    power(1000, s)
  end

  def power(%{classification: :M, scale: s}) do
    power(10, s)
  end

  def power(%{classification: :C, scale: s}) do
    power(1, s)
  end

  def flare_list(flares) do
    Enum.map flares, fn(flare) ->
      p = power(flare)
       {:flare, :power, p, :is_deadly, p > 1000}
    end
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

  def for_total_flare_power(flares) do
    (for flare <- flares, do: power(flare))
      |> Enum.sum
  end

  defp power(classification, scale) do
    classification * scale
  end
end
