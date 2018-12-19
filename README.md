These are the first, the original, the only OCaml koans. They are currently blank, as we'll do them in class.

# Setup

This assumes you installed OCaml like a good egg, you can start by using opam to setup the version of ocaml that we're using. This will also create an isolated environment, much like rvm.

```bash
cd ocaml-koans
opam switch create . 4.06.1
```
When you enter the directory now you don't have bindings for any tools like utop, even if you installed them globally. So install them now:

```bash
opam install utop merlin alcotest ocp-indent dune
```

Technically you only need `alcotest` to make this run, but the other libraries are useful for editor integration and a nice REPL.

## Running Tests

Run the koans by running `dune runtest`. This works like make, so it only runs on changes.
