# Escape.tech / Action

Run [Escape](https://escape.tech) directly in Github actions !

Using this action will allow you to start a security scan for a GraphQL application on the [Escape platform](https://app.escape.tech).

We recommend providing these values as [Encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

<img width="925" alt="image" src="https://user-images.githubusercontent.com/29194680/190671671-282f35dd-5e03-4ebe-9202-46ad590cde5d.png">

## Setup

This action requires an application ID and an API key to be provided. You can find both of these in the settings tab of your application on escape.

You can find theses values in your Escape application settings.

<img width="1290" alt="image" src="https://user-images.githubusercontent.com/29194680/190670679-9f0c4557-ec62-44df-8e63-2cdd29ddbb1b.png">

### Required arguments

- `application_id`: The id of the application on Escape, that will be scanned continuously
- `api_key`: Your API key on the Escape platform

### Optional

- `timeout`: The maximum time in seconds to wait for the scan to complete. Default is 1200 seconds.

## Usage example

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
          # timeout: 1200 (default - in seconds)
```
