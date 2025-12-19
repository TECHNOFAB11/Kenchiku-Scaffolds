# Scaffolds for Kenchiku

These are some scaffolds for [Kenchiku] I use personally or to test stuff out.

## Usage

To use these yourself:

1. Install [Kenchiku].

1. Clone `https://gitlab.com/TECHNOFAB/kenchiku-scaffolds` to your favorite place to store the scaffolds.

1. Set `KENCHIKU_PATH` to the cloned path.

    **Example**:

    ```sh
    git clone git@gitlab.com/TECHNOFAB/kenchiku-scaffolds ~/.local/share/kenchiku/scaffolds/example
    export KENCHIKU_PATH="$KENCHIKU_PATH:$HOME/.local/share/kenchiku/scaffolds/example"
    ```

1. Run the construct or patch command:

    ```sh
    kenchiku construct documents
    # or
    kenchiku patch documents:add_license
    ```

[kenchiku]: https://kenchiku.projects.tf "Kenchiku"
