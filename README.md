Any Shell Env
=============

This project allows you to write a single shell initilization file in bash, and
it will work in fish, zsh, bash, sh, tcsh, and csh. Support for other shells is
easy to add.

It was inspired by the needs of [Nix](https://nixos.org/nix/) and
[NixOS](https://nixos.org/nix/), which depend on shell initialization to set
environment variables and the like, but which should really be shell agnostic.

Bash was chosen as the scripting language to minimize dependencies and simplify
conversion of existing Nix shell init scripts.

Try It Out
----------

Start a fish shell and execute:

```fish
source examples/fish_example
echo $EXAMPLE
```

Start a bash/zsh/sh shell and execute:

```bash
source examples/sh_example
echo $EXAMPLE
```

Start a tcsh/csh shell and execute:

```tcsh
source examples/csh_example
echo $EXAMPLE
```

All of these examples are executing the same initialization script:
`examples/myinit`

Limitations
-----------

The initilization script can do many things, but some shell specific features
must still be implemented on a per-shell basis. Luckily, most projects like Nix
(the intended use case for this software) do not require these features.

Examples:

  * zstyle - zsh configuration program
  * command_not_found
  * etc.

TODO
----

  * Support for differentiating login shells and interactive shells
  * Test suite
  * Finalize design
