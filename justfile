default:
    @just --list

update:
    home-manager switch --flake .#becker
