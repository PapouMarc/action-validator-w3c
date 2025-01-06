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

### For 1 file

```
uses: actions/action-validator-w3c@v1
with:
  run-validator-w3c: './test/bad_test.html'
```
### For 1 directory

```
uses: actions/action-validator-w3c@v1
with:
  run-validator-w3c: './test'
```

# Changes Notes

## V1

Init projet only 1 file

## V2

Scan directory

## V3

Change checkout worflow