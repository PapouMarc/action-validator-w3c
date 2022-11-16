[![Test Validation Action](https://github.com/PapouMarc/action-validator-w3c/actions/workflows/dockerimage.yml/badge.svg)](https://github.com/PapouMarc/action-validator-w3c/actions/workflows/dockerimage.yml)


# docker validator w3c for file html/w3c

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