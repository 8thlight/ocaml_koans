open! Base
open! Stdio

let%expect_test "Sanity" =
  Lib.Sanity.sanity ();
  [%expect{| Hello, World! |}]
