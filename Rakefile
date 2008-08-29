erl = "erlc -W"

desc "ohai"
task :compile do
  Dir['**/*.erl'].each do |file|
    sh "#{erl} -o #{File.dirname(file)} #{file}"
  end
end

desc "Cleans Beams and Crash Dumps"
task :clean do
  sh "rm -rf *.beam **/*.beam erl_crash.dump"
end
