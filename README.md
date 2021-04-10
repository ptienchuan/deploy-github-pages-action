# Deploy Github Pages action

The Github Action for building and deploying the source code to a Github Pages branch.

## Example usage

#### Using default inputs

You can use the action with no `inputs` but the `env.GITHUB_TOKEN` is required.

See more about default input in [Input description](#input)

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: npm ci
      - name: Push changes
        uses: ptienchuan/deploy-github-pages-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

As above, the Github Action will do:

1. Build source code:

- Run `npm run build`

2. Push changes:

- Use `${{ secrets.GITHUB_TOKEN }}`
- to push everything in `docs`
- to branch `gh-pages`
- by the author has:
  - name: `github-action[bot]`
  - email: `github-action[bot]@noreply.github.com`

#### Using custome inputs

You can set the inputs match with the configurations of your project

See more about [Input description](#input)

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: npm ci
      - name: Push changes
        uses: ptienchuan/deploy-github-pages-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          source-directory: "docs/.vuepress/dist"
          target-branch: "gh-pages"
          user-name: "deploy[bot]"
          user-email: "deploy[bot]@noreply.github.com"
```

As above, the Github Action will do:

1. Build source code:

- Run `npm run build`

2. Push changes:

- Use `${{ secrets.GITHUB_TOKEN }}`
- to push everything in `docs/.vuepress/dist`
- to branch `gh-pages`
- by the author has:
  - name: `deploy[bot]`
  - email: `deploy[bot]@noreply.github.com`

## Env

**Required**

The action will NOT work if this env is missed

| Name           | Description                                                                                   |
| :------------- | :-------------------------------------------------------------------------------------------- |
| `GITHUB_TOKEN` | Token of the repo for authentication.<br>Can be passed in using `${{ secrets.GITHUB_TOKEN }}` |

## Input

All of these inputs are **optional**

| Name               | Default                                 | Description                                                     |
| :----------------- | :-------------------------------------- | :-------------------------------------------------------------- |
| `source-directory` | `docs`                                  | The source directory which contains the source code after built |
| `target-branch`    | `gh-pages`                              | The git branch where Github Pages be built from                 |
| `user-name`        | `github-action[bot]`                    | The name be used for author of deploy commit                    |
| `user-email`       | `github-action[bot]@noreply.github.com` | The email be used for author of deploy commit                   |
