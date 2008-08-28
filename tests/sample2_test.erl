-module(sample2_test).
-export([run/0]).

run() ->
  test(1),
  test(2),
  test(3),
  ok.

test(1) ->
  io:format("Running ~p:test 1~n", [?MODULE]),
  ok;
test(2) ->
  io:format("Running ~p:test 2~n", [?MODULE]),
  ok;
test(3) ->
  io:format("Running ~p:test 3~n", [?MODULE]),
  ok.
