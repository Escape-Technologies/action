# Escape.tech / Action

Run [Escape](https://escape.tech) directly in Github actions !

Using this action will allow you to start a security scan for a REST, GraphQL, or Frontend application on the [Escape platform](https://app.escape.tech).

We recommend providing these values as [Encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

<img width="925" alt="image" src="https://user-images.githubusercontent.com/29194680/190671671-282f35dd-5e03-4ebe-9202-46ad590cde5d.png">

## Setup

This action requires an application ID and an API key to be provided.

You can find theses values in your Escape application settings.

### Required arguments

- `application_id`: The id of the application on Escape, that will be scanned continuously
- `api_key`: Your API key on the Escape platform

### Optional

- `watch`: Wait for scan completion
- `configuration_override`: A JSON override of the scan configuration.
- `schema`: The schema local path or publicly accessible URL. If provided, it will update the schema for the application.

## Usage example

```yaml
---
name: Escape

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
          watch: "true" # to wait for scan completion
```
