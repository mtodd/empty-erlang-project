-module(runner).
-export([start/0]).

start() ->
  io:format("Running tests...~n"),
  
  % run tests
  {ok, Files} = file:list_dir("tests"),
  lists:map(fun(File) -> run_test({filename, File}) end, Files),
  
  io:format("Done.~n"),
  erlang:halt().

run_test({filename, File}) ->
  case file_is_test(File) of
    true -> run_test({test, string_to_atom(filename_without_extension(File, ".beam"))});
    false -> {skipped, File}
  end;
run_test({test, Atom}) ->
  io:format("Running test ~p...~n", [string_to_atom(Atom)]),
  
  % for some reason, this line makes a noisy "Eshell V5.6.2  (abort with ^G)"
  % notification...
  os:cmd(io_lib:format("erlc ~p > /dev/null", [Atom])),
  
  % run the test, finally
  apply(Atom, run, []).

file_is_test(File) ->
  case File of
    "runner.beam" -> false;
    _ -> case string:rstr(File, "_test.beam") > 0 of
      true -> file_is_beam(File);
      _ -> false
    end
  end.

file_is_beam(File) ->
  BeamPos = string:rstr(File, ".beam"),
  case BeamPos > 0 of
    true -> true;
    _ -> false
  end.

filename_without_extension(File, Ext) ->
  string:substr(File, 1, string:rstr(File, Ext) - 1).

string_to_atom(Name) ->
  list_to_atom(
    binary_to_list(
      term_to_binary(Name), 5, lists:flatlength(binary_to_list(term_to_binary(Name))))).
