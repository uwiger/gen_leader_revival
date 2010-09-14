
DIALYZER=dialyzer
DIALYZER_OPTS=-Wunmatched_returns -Wrace_conditions -Wunderspecs -Werror_handling -Wbehaviours
PLT_FILE=.gen_leader_plt


all: compile

compile:
	./rebar compile

doc:
	./rebar doc

plt:
	./rebar build_plt

check_plt:
	./rebar check_plt

analyze:
	$(DIALYZER) --plt $(PLT_FILE)  $(DIALYZER_OPTS) --verbose -r ebin --src src/gen_leader.erl examples/skeleton.erl

tests:
	./rebar eunit

clean:
	./rebar clean