(lang dune 3.17)
(using melange 0.1)
(name melange-cmdk)
(generate_opam_files true)
(source (github anyjump/melange-cmdk))
(authors "Ed <ed@anyjump.com>")
(maintainers "Ed <ed@anyjump.com>")
(license MIT)
(documentation https://github.com/anyjump/melange-cmdk)

(package
 (name melange-cmdk)
 (allow_empty)
 (depends
  ocaml
  melange
  reason-react
  reason-react-ppx
  melange-webapi
  melange-radix-ui
  ))
