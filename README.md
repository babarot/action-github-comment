action-github-comment
=====================

[![](https://github.com/b4b4r07/action-github-comment/workflows/release/badge.svg)](https://github.com/b4b4r07/action-github-comment/releases)

![](demo.png)

Post a text to GitHub issue / pull request

You can use the fixed version from: [Releases](https://github.com/b4b4r07/action-github-comment/releases/latest)

## Usage

A whole example is here:

```yaml
name: github-comment

on: [pull_request]

jobs:
  job1:
    name: github-comment
    runs-on: ubuntu-latest
    steps:
    - name: Post comments to GitHub
      uses: b4b4r07/action-github-comment@master
      with:
        body: |
          text...
          text...
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        LOG: trace
```

## Customizing

### inputs

The following are optional as `step.with` keys

| Name       | Type   | Description                                                       | Default |
| ---------- | ------ | ----------------------------------------------------------------- | ------- |
| `body`     | String | Text to be sent to GitHub |      |
| `repository` | String | GitHub repository. Its style should be like "owner/repo" | `${{ github.repository }}` |
| `number` | Int | An issue/pull request number you want to send a comment. Default is pull request number | `${{ github.event.pull_request.number }}` |

### outputs

The following outputs can be accessed via `${{ steps.<step-id>.outputs }}` from this action

| Name | Type | Description |
| ---- | ---- | ----------- |
| n/a  |      |             |

### environment variables

The following are as `step.env` keys

| Name           | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| `GITHUB_TOKEN` | Token to be used for posting comment                         |
| `ENV`          | Log level to spit out what happened in `github-comment` command (`trace`, `debug`, `info`, `warn` and `error` are allowed) |

## License

[MIT](https://b4b4r07.mit-license.org/)
