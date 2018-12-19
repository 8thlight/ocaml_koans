let __ = false
let ___ = 1.0
let ____ = 0

let basic_equality_test () =
  Alcotest.(check bool) "Checking for equal objects" true (__ = true)

let identity_test () =
  Alcotest.(check bool) "Bools have the same identity" true (__ == true)

let comparing_integers () =
  Alcotest.(check bool) "Equal" __ (0 = 0);
  Alcotest.(check bool) "Identical" __ (0 == 0);
  Alcotest.(check bool) "Not equal" __ (1 <> 0);
  Alcotest.(check bool) "Not identical" __ (1 != 0)

let comparing_floats_may_not () =
  Alcotest.(check bool) "Equal" true (___ = 0.0);
  Alcotest.(check bool) "Identical" false (___ == 0.0);
  Alcotest.(check bool) "Not equal" __ (1 <> 0);
  Alcotest.(check bool) "Not identical" __ (1 != 0)

let simple_string_comparison () =
  Alcotest.(check bool) "Equal" __ ("foo" = "foo")

(* Add enums, strings, and what is nil *)
(* And operators *)

let equality_set = [
  "Check Basic Equality", `Quick, basic_equality_test;
  "Check Identity", `Quick, identity_test;
  "Compare Integers", `Quick, comparing_integers;
  "Compare Floats", `Quick, comparing_floats_may_not;
  "Compare Strings", `Quick, simple_string_comparison;
]

let () =
  Alcotest.run "Equality" ["equality_set", equality_set]
