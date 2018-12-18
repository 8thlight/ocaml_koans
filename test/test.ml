
let my_test () =
  Alcotest.(check int) "sanity is 3" 3 (Lib.Sanity.sanity ())

let my_test_2 () =
  Alcotest.(check int) "sanity is also 4" 3 (Lib.Sanity.sanity ())


let assert_set = [
  "Asserts", `Quick, my_test;
  "More Asserts", `Quick, my_test_2;
]

let () =
  Alcotest.run "Asserts" ["assert_set", assert_set]
