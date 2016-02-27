defmodule FibSolver do

  def fib(scheduler) do
    send scheduler, { :ready, self }
    receive do
      { :start, client, n } ->
        send client, { :answer, n, fib_calc(n), self }
        fib(scheduler)

      { :shutdown } ->
        exit(:normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n - 1) + fib_calc(n - 2)

end

defmodule TaskScheduler do

    def run(num_process, module, func, to_calculate) do
      (1..num_process)
      |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
      |> schedule_processes(to_calculate, [])
    end

    defp schedule_processes(processes, queue, results) do
      receive do
        {:ready, pid} when length(queue) > 0 ->
          # IO.puts "Scheduler: #{inspect pid} is ready"
          [next | tail] = queue
          send pid, {:start, self, next}
          schedule_processes(processes, tail, results)

        {:ready, pid} ->
          # IO.puts "Scheduler: #{inspect pid} is ready but there's nothing to process"
          send pid, {:shutdown}
          if length(processes) > 1 do
            schedule_processes(List.delete(processes, pid), queue, results)
          else
            Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
          end

        {:answer, number, result, _} ->
          # IO.puts "Scheduler: #{inspect pid} is sending the answer for #{number} as #{result}"
          schedule_processes(processes, queue, [{number, result} | results])
      end
    end

end


to_process = [40, 37, 40, 37, 40]

Enum.each 1..5, fn processes ->
  {time, result} = :timer.tc(TaskScheduler, :run, [processes, FibSolver, :fib, to_process])
  if processes == 1 do
    IO.puts inspect result
    IO.puts "\n # time(s)"
  end
  :io.format "~2B    ~.2f~n", [processes, time/1000000.0]
end
