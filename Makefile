.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

.yrl.erl:
	erlc -W $<

ERL = erl -boot start_clean

# specify the modules to compile. Separate lines with \
MODS = module1

all: compile

compile: ${MODS:%=%.beam} subdirs

test: compile
	${ERL} -pa tests -s runner start

subdirs:
	cd tests; erlc *.erl

# remove all the code

clean:
	rm -rf **/*.beam erl_crash.dump
