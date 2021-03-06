{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:hound)
ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PhoenixTodoList.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PhoenixTodoList.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PhoenixTodoList.Repo)

