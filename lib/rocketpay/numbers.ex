defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |>File.read()
    |>handle_file()
  end

  defp handle_file({:ok, result}) do
    result = String.split(result, ",")
    result = Enum.map(result, fn number -> String.to_integer(number) end)
    result = Enum.sum(result)
    result
  end
  defp handle_file({:error, _reason}), do: {:error, "Invalid file!"}
end
