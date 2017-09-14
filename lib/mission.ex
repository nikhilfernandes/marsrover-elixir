alias MarsRover.InputParser
alias MarsRover.Plateau
alias MarsRover.Rover
alias MarsRover.Position

defmodule MarsRover.Mission do

  defstruct plataeu: MarsRover.Plateau, rover: MarsRover.Rover

  def main(input) do
    input
    |> InputParser.process
    |> execute
  end

  def execute({plateau, %Rover{current_position: current_position, remaining_instructions: remaining_instructions}} = marsrover) do
    if String.length(remaining_instructions) == 1 do
      new_position = Position.new_position(current_position, remaining_instructions)
      case Plateau.inside_plateau_bounds(plateau, new_position) do
        :ok ->
            new_position
        {:error, :out_of_plateau_bound} -> raise "Rover out of bound"
      end
    else
      {current_instr, rest_instr } = String.next_grapheme(remaining_instructions)
        new_position = Position.new_position(current_position, current_instr)
        case Plateau.inside_plateau_bounds(plateau, new_position) do
          :ok ->
              rover = %Rover{current_position: new_position, remaining_instructions: rest_instr }
              MarsRover.Mission.execute({plateau, rover})
          {:error, :out_of_plateau_bound} -> raise "Rover out of bound"
        end

    end
  end



end
