use "Test.sml";

val tests = [ assert_true("Is True", true),
              assert_false("Is False", false),
              assert_string("Strings should be equal", "s", "s"),
	      assert_int("Ints should be equal", 1, 1) ];

run_tests("Test Case 1", tests);

val failing_tests = [ assert_true("Test 3", true),
		      assert_false("Test 4", false),
		      assert_list("List Equals", [1,2,3], [1,2,4])];

run_tests("Test Case 2", failing_tests);
    


