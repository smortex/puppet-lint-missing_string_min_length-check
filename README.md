# puppet-lint missing string minimum length check

Adds a new puppet-lint check to verify all String data types have an explicit minimum length.

The default value for `String` accept empty strings, but generaly `undef` should be preferred to an empty string and what the user really wanted was `String[1]`.  With this module, strings that can be empty have to be explicitly declared as `String[0]` which avoid ambiguity.
