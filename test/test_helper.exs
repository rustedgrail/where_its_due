ExUnit.start

Mix.Task.run "ecto.create", ~w(-r WhereItsDue.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r WhereItsDue.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(WhereItsDue.Repo)

