# Escape.tech / Action

Run [Escape](https://escape.tech) directly in Github actions !

Using this action will allow you to start a security scan for a GraphQL application on the [Escape platform](https://app.escape.tech).

We recommend providing these values as [Encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

<img width="925" alt="image" src="https://user-images.githubusercontent.com/29194680/190671671-282f35dd-5e03-4ebe-9202-46ad590cde5d.png">

## Setup

This action requires an application ID and an API key to be provided.

You can find theses values in your Escape application settings.

<img width="1143" alt="image" src="https://user-images.githubusercontent.com/29194680/197798467-f09b46b0-9651-4d04-bf34-4d26ce268187.png">

### Required arguments

- `application_id`: The id of the application on Escape, that will be scanned continuously
- `api_key`: Your API key on the Escape platform

### Optional

- `timeout`: The maximum time in seconds to wait for the scan to complete. Default is 1200 seconds.
- `configuration_override`: A JSON override of the scan configuration. [See the docs on configuration overrides](https://escape.tech/docs/ci-cd/techniques/configuration-override)
- `configuration_override_path`: Loads `configuration_override` from a file. [See the docs on configuration overrides](https://escape.tech/docs/ci-cd/techniques/configuration-override)
- `introspection_file`: The relative path to a JSON file containing an introspection response for updating the application's introspection on Escape. [See the docs on introspection update](https://docs.escape.tech/ci-cd/introspection-update)
- `schema_file`: The relative path to a GraphQL schema file for updating the application's introspection on Escape. [See the docs on introspection update](https://docs.escape.tech/ci-cd/introspection-update)
- `fail_on_severities`: A csv-delimited list of severities to fail on, can be HIGH, MEDIUM, LOW, INFO. [See the docs from the cli](https://www.npmjs.com/package/@escape.tech/action)

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
          # timeout: 1200 (default - in seconds) (use 0 for non blocking pipelines)
```
