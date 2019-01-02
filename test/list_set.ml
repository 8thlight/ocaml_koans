open Base

let __ = false
let ___ = -1
let ____ = "false"


(* In OCaml Base, List.nth returns an Option value. This is simply
   a helper functon to pull out the value of the Some *)
let get_string_value_at arr indx =
  Option.value ~default:"" (List.nth arr indx)

let get_int_value_at arr indx =
  Option.value ~default:0 (List.nth arr indx)


let identity_test () =
  Alcotest.(check bool) "Lists have the same identity" __
    (
      (* In OCaml Base, comparitors (=, ==, !=, etc) only work for integers *)
      phys_equal [] []
    )

let appending_to_list () =
  Alcotest.(check string) "First Element" "foo"
    (
      (* See comment above get_string_value *)
      get_string_value_at ([____; "boo";]@["loo";]) 0
    );

  Alcotest.(check string) "First Element" "boo"
    (
      get_string_value_at (["foo"; ____;]@["loo";]) 1
    );

  Alcotest.(check string) "First Element" "loo"
    (
      get_string_value_at (["foo"; "boo";]@[____;]) 2
    )

let length_of_list () =
  Alcotest.(check int) "Length Should Be 0" ___
    (
      List.length []
    )

let map_filter_reduce () =
  Alcotest.(check bool) "Mapping over an empty list" true
    (
      phys_equal (List.map ~f:(fun x -> x*x) []) []
    );

  Alcotest.(check bool) "Mapping over a list of integers" true
    (
      (* The function passed to ~equal is used to determine the equality of the elements.
         E.g. phys_equal ListA[0] ListB[0] *)
      List.equal ~equal:phys_equal (List.map ~f:(fun x -> x * x) [1;2;3]) [___;___;___]
    );

  Alcotest.(check int) "Mapping over a list of integers - second element" 4
    (
      get_int_value_at (List.map ~f:(fun x -> x * ___) [1;2;3]) 1
    );

  Alcotest.(check bool) "Filtering a list of integers" true
    (
      List.equal ~equal:phys_equal (List.filter ~f:(fun x -> phys_equal x 3) [1;2;3]) [___]
    );

  Alcotest.(check bool) "Filtering a list where no entries match" true
    (
      List.equal ~equal:phys_equal (List.filter ~f:(fun x -> phys_equal x ___) [-1;2;3]) []
    );

  Alcotest.(check int) "Summing a list using reduce" 6
    (
      Option.value ~default:0 (
        List.reduce ~f:(+) [1; 2; 3;]
      )
    );

  Alcotest.(check string) "Concatenating list of strings using reduce" "mylistreduced"
    (
      Option.value ~default:"" (
        List.reduce ~f:(fun acc indx -> acc ^ indx) [____; "list"; "reduced";]
      )
    );

  Alcotest.(check string) "Reducing a string list with a default value" "defaultlistreduced"
    (
      let list = ["list"; "reduced"] in
      let default = ____ in
      Option.value ~default:"" (
        (* List.reduce does not allow a base default value to be passed.
           By sticking a default value at the beginning of our list, we can
           effectively set a default *)
        List.reduce ~f:(fun acc indx -> acc ^ indx) ([default;]@list)
      )
    )

let list_set = [
  "Check identity", `Quick, identity_test;
  "Append To a List", `Quick, appending_to_list;
  "Check Length of List", `Quick, length_of_list;
  "Map, Filter, and Reduce", `Quick, map_filter_reduce;
]
