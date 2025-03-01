default:
    @just --list

update:
    home-manager switch --flake .#becker

# run this when your disk needs space
# https://github.com/Evertras/simple-homemanager/blob/main/02-basic-repository-setup.md#a-cleanup-step
clean:
    nix-collect-garbage -d
