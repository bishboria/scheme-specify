Simple attempt at a testing framework in Scheme

Failing facts (assertions) have the following form:

	expected x to be 5 but got 6

When all facts are as expected, then the output will look something like:

	(. . . .)

During intermediate stages of failing and passing tests, all failing are listed last.
