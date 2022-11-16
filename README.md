![](https://github.com/PapouMarc/action-validator-w3c/workflows/Test%20Validation%20Action/badge.svg)


# docker validator w3c action

you can run a test validator w3c on the file

## Inputs

### `run-validator-w3c`

**Required** The name of script to run. Default `"Noscript"`.

## Outputs

### `result-validator-w3c`

return result.

## Example usage

uses: actions/action-validator-w3c@v1
with:
  run-validator-w3c: './test/bad_test.html'