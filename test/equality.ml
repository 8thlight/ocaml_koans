let __ = false
let ___ = 1.0
let ____ = 0

let basic_equality_test () =
  Alcotest.(check bool) "Checking for equal objects" true
    (
      __ = true
    );

  Alcotest.(check bool) "Checking for equal empty list" __
    (
      [] = []
    )

let identity_test () =
  Alcotest.(check bool) "Bools have the same identity" true
    (
      __ == true
    )

let comparing_integers () =
  Alcotest.(check bool) "Equal" __
    (
      0 = 0
    );

  Alcotest.(check bool) "Identical" __
    (
      0 == 0
    );

  Alcotest.(check bool) "Not equal" true
    (
      ____ <> 0
    );

  Alcotest.(check bool) "Not identical" true
    (
      ____ != 0
    )

let comparing_floats_may_not () =
  Alcotest.(check bool) "Equal" __
    (
      0.0 = 0.0
    );

  Alcotest.(check bool) "Identical" __
    (
      0.1 == 0.0
    );

  Alcotest.(check bool) "Not equal" true
    (
      ___ <> 0.0
    );

  Alcotest.(check bool) "Not identical" true
    (
      ___ != 0.0
    )

let comparing_lists () =
  Alcotest.(check bool) "Equal" true
    (
      [____] = [ 2; 3; ]
    );

  Alcotest.(check bool) "Identical" true
    (
      [____] == [ 2; 3; ]
    );

  Alcotest.(check bool) "Not Equal" true
    (
      [ 2; ] <> [____]
    );

  Alcotest.(check bool) "Not Identical" true
    (
      [____] != [ 0; ]
    )


let equality_set = [
  "Check Basic Equality", `Quick, basic_equality_test;
  "Check Identity", `Quick, identity_test;
  "Compare Integers", `Quick, comparing_integers;
  "Compare Floats", `Quick, comparing_floats_may_not;
  "Compare Lists", `Quick, comparing_lists;
]
