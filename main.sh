#!/bin/sh

if [ -z "${ESCAPE_APPLICATION_ID}" ]; then
    echo "ESCAPE_APPLICATION_ID is not set"
    exit 1
fi
if [ -z "${ESCAPE_API_KEY}" ]; then
    echo "ESCAPE_API_KEY is not set"
    exit 1
fi

# Update the schema if requested
if [ ! -z "${ESCAPE_SCHEMA}" ]; then
    echo "Updating schema"
    escape-cli update-schema "${ESCAPE_APPLICATION_ID}" "${ESCAPE_SCHEMA}"
fi

# Setup args
_ARGS="scan start \"${ESCAPE_APPLICATION_ID}\""
if [ "${ESCAPE_WATCH}" = "true" ]; then
    _ARGS="${_ARGS} --watch"
fi
if [ ! -z "${ESCAPE_CONFIGURATION_OVERRIDE}" ]; then
    _ARGS="${_ARGS} --configuration-override ${ESCAPE_CONFIGURATION_OVERRIDE}"
fi

echo
echo "Running scan:"
echo "escape-cli ${_ARGS}"
echo

escape-cli ${_ARGS}
