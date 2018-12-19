let __ = "boo"
let ___ = ""

let comparing_strings () =
  Alcotest.(check bool) "Equal" true ("boo" = "boo");
  Alcotest.(check bool) "Equal" false (___ = "boo");
  Alcotest.(check bool) "Identical" false ("boo" == "boo");
  Alcotest.(check bool) "Not Equal" true ("foo" <> "boo");
  Alcotest.(check bool) "Not Identical" true ("foo" != "foo")

let comparing_multiline_strings () =
  Alcotest.(check @@ neg string) "Diff strings with newline not equal" "boo\nfoo" "boo\nboo";
  Alcotest.(check string) "String with newline equal" "boo\nboo" "boo\nboo";
  Alcotest.(check @@ neg string) "Diff strings with diff newline Not Equal" "boo\nfoo" "boo\n\nboo";
  Alcotest.(check @@ neg string) "String with diff newline not equal" "boo\nboo" "boo\n\nboo"

let comparing_empty_strings () =
  Alcotest.(check string) "Equal" ___ "";
  Alcotest.(check string) "Equal Strings" __ "boo";
  Alcotest.(check @@ neg string) "Not Equal Stings" __ "foo";
  Alcotest.(check @@ neg string) "Empty string not equal to empty string with space" ___ " ";
  Alcotest.(check @@ neg string) "Empty string not equal to empty string with space" ___ " "

let comparing_char () =
  Alcotest.(check @@ neg char) "Chars not equal" 'a' 'A';
  Alcotest.(check char) "Chars equal" 'B' 'B';
  Alcotest.(check char) "Specia chars equal" '@' '@';
  Alcotest.(check @@ neg char) "Chars not equal" '*' '?';
  Alcotest.(check char) "Chars with space equal" ' ' ' '

let comparing_char_vs_string () =
  Alcotest.(check string) "Char converted to string" "a" (String.make 1 'a')

let strings_set = [
  "Compare Strings", `Quick, comparing_strings;
  "Compare Multi-line Strings", `Quick, comparing_multiline_strings;
  "Compare Empty Strings", `Quick, comparing_empty_strings;
  "Compare Chars", `Quick, comparing_char;
  "Compare Chars vs Strings", `Quick, comparing_char_vs_string;
]
