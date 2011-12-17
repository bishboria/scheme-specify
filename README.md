Simple attempt at a testing framework in Scheme

Failing facts (assertions) have the following form:

	(expected (+ 1 1) to be 3 but is 2)

When all facts are as expected, then the output will look something like:

	(. . . .)

During intermediate stages of failing and passing tests, all failing are listed last.
