open Base

let __ = false
let ___ = -1
let ____ = "false"


let get_string_value_at arr indx =
  Option.value ~default:"" (List.nth arr indx)

let get_int_value_at arr indx =
  Option.value ~default:0 (List.nth arr indx)


let identity_test () =
  Alcotest.(check bool) "Lists have the same identity" true (
    phys_equal [] []
  )

let appending_to_list () =
  Alcotest.(check string) "First Element" "foo"
    (
      get_string_value_at (["foo"; "boo";]@["loo";]) 0
    );

  Alcotest.(check string) "First Element" "boo"
    (
      get_string_value_at (["foo"; "boo";]@["loo";]) 1
    );

  Alcotest.(check string) "First Element" "loo"
    (
      get_string_value_at (["foo"; "boo";]@["loo";]) 2
    )

let length_of_list () =
  Alcotest.(check int) "Length Should Be 0" 0 (
    List.length []
  )

let map_filter_reduce () =
  Alcotest.(check bool) "Mapping over an empty list" true
    (
      phys_equal (List.map ~f:(fun x -> x*x) []) []
    );

  Alcotest.(check bool) "Mapping over a list of integers - first element" true
    (
      List.equal ~equal:phys_equal (List.map ~f:(fun x -> x*x) [1;2;3]) [1;4;9]
    );

  Alcotest.(check int) "Mapping over a list of integers - second element" 4
    (
      get_int_value_at (List.map ~f:(fun x -> x*x) [1;2;3]) 1
    );

  Alcotest.(check int) "Mapping over a list of integers - third element" 9
    (
      get_int_value_at (List.map ~f:(fun x -> x*x) [1;2;3]) 2
    );

  Alcotest.(check bool) "Filtering a list of integers" true
    (
      List.equal ~equal:phys_equal (List.filter ~f:(fun x -> phys_equal x 3) [1;2;3]) [3;]
    );

  Alcotest.(check bool) "Filtering a list where no entries match" true
    (
      List.equal ~equal:phys_equal (List.filter ~f:(fun x -> phys_equal x 20) [1;2;3]) []
    );

  Alcotest.(check int) "Summing an list using reduce" 6
    (
      Option.value ~default:0 (
        List.reduce ~f:(+) [1; 2; 3;]
      )
    );

  Alcotest.(check string) "Concatenating list of strings using reduce" "mylistreduced"
    (
      Option.value ~default:"" (
        List.reduce ~f:(fun acc indx -> acc ^ indx) ["my"; "list"; "reduced";]
      )
    );

  Alcotest.(check string) "Reducing a string list with a default value" "defaultlistreduced"
    (
      let list = ["list"; "reduced"] in
      let default = "default" in
      Option.value ~default:"" (
        List.reduce ~f:(fun acc indx -> acc ^ indx) ([default;]@list)
      )
    )

let list_set = [
  "Check identity", `Quick, identity_test;
  "Append To a List", `Quick, appending_to_list;
  "Check Length of List", `Quick, length_of_list;
  "Map, Filter, and Reduce", `Quick, map_filter_reduce;
]
