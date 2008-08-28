-module(runner)
-export([start/0])

start() ->
  io:format("Running tests...~n"),
  % run tests
  io:format("Done.~n").
