#!/usr/bin/env bats
script1=$(mktemp -t "anyshelltest")
cat <<SCRIPT > $script1
    setEnv 'testVar' 'tricky string'
SCRIPT

@test "bash sets environment variables correctly" {
    run bash -c 'eval `./any-shell-init sh '"$script1"'`; echo $testVar'

    [ "$status" -eq 0 ]
    [ "$output" = 'tricky string' ]
}

@test "zsh sets environment variables correctly" {
    run zsh -c 'eval `./any-shell-init sh '"$script1"'`; echo $testVar'

    [ "$status" -eq 0 ]
    [ "$output" = 'tricky string' ]
}

@test "fish sets environment variables correctly" {
    run fish -c 'eval (./any-shell-init fish '"$script1"'); echo $testVar;'

    [ "$status" -eq 0 ]
    [ "$output" = 'tricky string' ]
}

@test "csh sets environment variables correctly" {
    run tcsh -c 'eval `./any-shell-init tcsh '"$script1"'`; echo $testVar'

    [ "$status" -eq 0 ]
    [ "$output" = 'tricky string' ]
}

@test "passing an invalid shell generates an error" {
    run ./any-shell-init foobar "$script1"
    [ "$status" -ne 0 ]
}

@test "passing an invalid script generates an error" {
    run ./any-shell-init sh /not/a/file
    [ "$status" -ne 0 ]
}
