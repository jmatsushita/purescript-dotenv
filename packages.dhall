let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.10-20230802/packages.dhall
        sha256:7304ec70da54602347b6dfeaf80121a2c35330e709234f0eb1d66406be6b5b58

in  upstream
  with node-buffer.version = "v9.0.0"
  with node-child-process.version = "v11.0.0"
  with node-fs.version = "v9.1.0"
  with node-process.version = "v11.2.0"
  with node-streams.version = "v9.0.0"

  with variant = {
    dependencies =
      [ "arrays"
      , "assert"
      , "bifunctors"
      , "console"
      , "const"
      , "control"
      , "distributive"
      , "effect"
      , "either"
      , "foldable-traversable"
      , "foreign-object"
      , "functors"
      , "identity"
      , "lists"
      , "maybe"
      , "newtype"
      , "ordered-collections"
      , "partial"
      , "prelude"
      , "profunctor"
      , "record"
      , "safe-coerce"
      , "transformers"
      , "tuples"
      ]
    , repo = "https://github.com/sigma-andex/purescript-variant"
    , version = "switch-to-visible-type-applications"
  }

  with run = {
    dependencies =
      [ "aff"
      , "arrays"
      , "console"
      , "control"
      , "effect"
      , "either"
      , "foldable-traversable"
      , "free"
      , "identity"
      , "maybe"
      , "minibench"
      , "newtype"
      , "partial"
      , "prelude"
      , "tailrec"
      , "transformers"
      , "tuples"
      , "type-equality"
      , "typelevel-prelude"
      , "unsafe-coerce"
      , "variant"
      ]
    , repo = "https://github.com/jmatsushita/purescript-run"
    , version = "master"
  }