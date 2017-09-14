defmodule MarsRover.Plateau do
  defstruct maxX: nil, maxY: nil

  def inside_plateau_bounds(%MarsRover.Plateau{maxX: maxX, maxY: maxY} = plataeu, position) do
    if position.xPos in 0..maxX and position.yPos in 0..maxY do
      :ok
    else
      {:error, :out_of_plateau_bound}
    end
  end

end
