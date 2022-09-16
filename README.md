# Escape.tech / Action

## Setup

You need two environment variable to setup continous scan integration:

- `APPLICATION_ID`: 
- `API_KEY`: 

- `TIMEOUT`: (optional)

## Usage

```yaml
on:
  push:
    branches:
      - main
jobs:
  Escape:
    runs-on: ubuntu-latest
    steps:
      - name: Escape Scan
      uses: Escape-Technologies/action@v1
      with:
        ESCAPE_APPLICATION_ID: ${{ secrets.ESCAPE_APPLICATION_ID }}
        ESCAPE_API_KEY: ${{ secrets.ESCAPE_API_KEY }}
```
