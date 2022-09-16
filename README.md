# Escape.tech / Action

## Setup

You need two environment variable to setup continous scan integration:

- `APPLICATION_ID`: Your Escape application ID
- `API_KEY`: Your Escape API key

You can find theses values in your Escape application settings.

### Optional

- `TIMEOUT`: The maximum time in seconds to wait for the scan to complete. Default is 1200 seconds.

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
      uses: Escape-Technologies/action@v0
      with:
        application_id: ${{ secrets.ESCAPE_APPLICATION_ID }}
        api_key: ${{ secrets.ESCAPE_API_KEY }}
```
