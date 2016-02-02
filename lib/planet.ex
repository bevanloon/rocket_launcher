defmodule Planet do
  import Calcs
  import Laws

  defstruct [
    name: "Earth",
    type: :rocky,
    mass: nil,
    radius: nil,
    ev: nil
    ]

  def planet_list do
    [{:mercury, %Planet{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6}},
      {:venus, %Planet{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6}},
      {:earth, %Planet{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}},
      {:mars, %Planet{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6}},
      {:jupiter, %Planet{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}},
      {:saturn, %Planet{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}},
      {:uranus, %Planet{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}},
      {:neptune, %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}}]
  end

  def load do
    for planet <- planet_list, do: calculate_escape(planet)
  end

  def select do
    load
  end

  def earth do
    %{mass: 5.972e24, radius: 6.37e6}
  end
  def mars do
    %{mass: 6.41e23, radius: 3.4e6}
  end
  def moon do
    %{mass: 7.35e22, radius: 1.738e6}
  end

  defp calculate_escape({name, planet}) do
    {name, %{planet | ev:
    2 * newtons_gravitational_constant * planet.mass / planet.radius
      |> square_root
      |> to_km
      |> nearest_tenth}}
  end
end
