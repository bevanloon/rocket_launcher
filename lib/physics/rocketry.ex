defmodule Physics.Rocketry do
  import Calcs
  import Planets
  import Laws

  def escape_velocity(:earth) do
    escape_velocity(earth)
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> nearest_tenth
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * earth.mass  / orbital_radius(height)
    |> square_root
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) /
        (newtons_gravitational_constant * earth.mass)
      |> square_root
      |> seconds_to_hours
  end

  def height_for_orbital_term(term) do
      newtons_gravitational_constant *
        earth.mass *
        (term |> squared)  /
        4 * (:math.pi |> squared)
        |> cube_root
  end

  defp orbital_radius(height) do
    earth.radius + (height |> to_m)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
     |> square_root
  end
end
