let __ = false
let ___ = "boo"
let ____ = ""
let _____ = ' '
let ______ = 2

let comparing_strings () =
  Alcotest.(check bool) "Equal" true (____ = "boo");
  Alcotest.(check bool) "Equal" false (___ = "boo");
  Alcotest.(check bool) "Identical" __ ("boo" == "boo");
  Alcotest.(check bool) "Not Equal" true (___ <> "boo");
  Alcotest.(check bool) "Not Identical" true ("foo" != "foo")

let comparing_multiline_strings () =
  Alcotest.(check @@ neg string) "Diff strings with newline not equal" "boo\nboo" "boo\nboo";
  Alcotest.(check string) "String with newline equal" "boo\nfoo" "boo\nboo";
  Alcotest.(check @@ neg string) "Diff strings with diff newline Not Equal" "boo\n\nboo" "boo\n\nboo"

let comparing_empty_strings () =
  Alcotest.(check string) "Equal" ___ "";
  Alcotest.(check string) "Equal Strings" ____ "boo";
  Alcotest.(check @@ neg string) "Not Equal Stings" ___ "foo";
  Alcotest.(check @@ neg string) "Empty string not equal to empty string with space" ___ " "

let comparing_char () =
  Alcotest.(check @@ neg char) "Chars not equal" _____ 'A';
  Alcotest.(check char) "Chars equal" _____ 'B';
  Alcotest.(check char) "Special chars equal" _____ '@';
  Alcotest.(check @@ neg char) "Chars not equal" _____ '?';
  Alcotest.(check char) "Chars with space equal" _____ ' '

let comparing_char_vs_string () =
  Alcotest.(check string) "Char converted to string" "a" (String.make ______ 'a')

let strings_set = [
  "Compare Strings", `Quick, comparing_strings;
  "Compare Multi-line Strings", `Quick, comparing_multiline_strings;
  "Compare Empty Strings", `Quick, comparing_empty_strings;
  "Compare Chars", `Quick, comparing_char;
  "Compare Chars vs Strings", `Quick, comparing_char_vs_string;
]
