## 🐋 Setup with a `Dev Container`

If you use [Visual Studio Code](https://code.visualstudio.com) as your editor
and you have [Docker](https://www.docker.com) installed,
you can use the [Dev Container](https://code.visualstudio.com/docs/remote/containers)
to get a development environment up and running quickly.

This way you don't have to install any specific dependencies on your local machine.
The whole development environment will be running inside a Docker container.

If you open the project in Visual Studio Code,
you should be prompted to reopen the project in a Dev Container.
You can also click
[here](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/quickplates/generic-example)
or on the badge below to tell Visual Studio Code to open the project in a Dev Container.

<div align="center">

[![Open in Dev Container](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/quickplates/generic-example)

</div>

## ❄️ Setup with `Nix`

If you don't want to use the Dev Container,
you can also use [Nix](https://nixos.org) to setup your development environment.
`flake.nix` contains the configuration of development shells.
`Nix` will automatically install all dependencies and setup the environment for you.

All you need to do is have Nix installed and run the following command:

```sh
nix develop
```

or in case you don't have experimental features enabled globally:

```sh
nix --extra-experimental-features 'nix-command flakes' develop
```

This will drop you into a new shell with all dependencies installed.
If you want to exit the shell, just type `exit` or press `Ctrl + D`.

## 📁 Using `direnv`

If you have [`direnv`](https://direnv.net) installed,
and you run `direnv allow` in the project root,
you will automatically enter the development shell
whenever you enter the project directory.
Additionally, `direnv` will rebuild the development shell in background
whenever there are changes to files that are used to build the shell.

If you use the Dev Container setup,
you will have the `direnv` extension installed in Visual Studio Code.
This should automatically ask you to allow `direnv` when you open the project.

## 🧹 Using `Trunk`

This project uses [`Trunk`](https://trunk.io) to help with development.
It manages formatting, linting and running various actions.
This way all developers use the same tools and configurations.

There are multiple ways in which you can use `Trunk`.
Here are the most common ones:

- `trunk fmt` - Run formatting on the whole project
- `trunk check` - Run linting on the whole project
- `trunk run update-flake-lock` - Run an action that updates the `flake.lock` file

Linting is automatically run on every pull request and push to the `main` branch.
You can find the GitHub Actions workflow that does this in `.github/workflows/lint.yml`.

If you use the Dev Container setup,
you will have the `Trunk` extension installed in Visual Studio Code.
`Trunk` will be set as the default formatter for all files,
so you can format with it by using any editor formatting features.

## 📄 Docs

This project uses [`Docusaurus`](https://docusaurus.io) to generate documentation.
The documentation is hosted on GitHub Pages and can be found
[here](https://quickplates.github.io/generic-example).
All the documentation files are located in the `docs` directory.

To build and serve the documentation locally,
you can run the following command from the `docs` directory:

```sh
npm run docs start
```

This will start a local server that will serve the documentation.
You can then access it at
[`http://localhost:3000/generic-example`](http://localhost:3000/generic-example).

The documentation is automatically built and deployed to GitHub Pages
whenever a commit is pushed to the `main` branch.
You can find the GitHub Actions workflow that does this in `.github/workflows/docs.yml`.
