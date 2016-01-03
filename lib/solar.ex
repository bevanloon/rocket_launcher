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

  def power(classification, scale) do
    classification * scale
  end
end
