-module(sample_test).
-export([run/0]).

run() ->
  test(1),
  ok.

test(1) ->
  io:format("Running ~p:test 1~n", [?MODULE]),
  ok.
