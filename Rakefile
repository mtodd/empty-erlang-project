erl = "erl -boot start_clean"
erlc = "erlc -W"

desc "Compile Erlang source files into Beams"
task :compile do
  Dir['**/*.erl'].each do |file|
    sh "#{erlc} -o #{File.dirname(file)} #{file}"
  end
end

desc "Cleans Beams and Crash Dumps"
task :clean do
  sh "rm -rf *.beam **/*.beam erl_crash.dump"
end

desc "Run tests"
task :tests do
  Rake::Task['compile'].invoke
  sh "#{erl} -pa tests -s runner start"
end
