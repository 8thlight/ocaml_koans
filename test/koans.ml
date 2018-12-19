let () =
  Alcotest.run "Koans"
    ["equality_set", Equality.equality_set;
     "list_set", List.list_set
    ]
