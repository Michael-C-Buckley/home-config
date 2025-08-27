# Michael's Home Configs

This is a collection of my user-space files I have and use. It is designed to be somewhat portable

These are some home directory configurations I have. They are provided by [Home-Manager](https://github.com/nix-community/home-manager) and also by [Hjem](https://github.com/feel-co/hjem).

## Home-Manager

Home-Manager is a well-known and widely used for a variety of user-space management and configurations. Provides a lot of modules and options for declarative management.

My use of home-manager does not use the module system they provide and instead mainly uses their linker. This is for on systems that are not NixOS but maintains compatibility with Hjem-based configs as well.

## Hjem

Hjem is a newer, simpler version of file linking. Useful for providing only declarative and collected dotfile management without the overhead, complexity, and potential breakage that home-manager has.

This implementation is currently primarily for my servers, where I don't have or need extensive applications and their configurations. However, I am planning on moving all my configs to this for all NixOS systems and am working toward that goal.

## Credits

Special thanks to those whose flakes or projects have provided inspiration and I have used configurations from:

- [Arbel's Starship toml](https://forgejo.spacetime.technology/arbel/nixos)
- [Waybar Minimal](https://github.com/ashish-kus/waybar-minimal/tree/main)
