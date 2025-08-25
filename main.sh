#!/bin/sh

PROFILE_ID="${ESCAPE_PROFILE_ID:-}"
if [ -z "${PROFILE_ID}" ]; then
    PROFILE_ID="${ESCAPE_APPLICATION_ID:-}"
    if [ -n "${PROFILE_ID}" ]; then
        echo "Using deprecated ESCAPE_APPLICATION_ID; please update to ESCAPE_PROFILE_ID"
    fi
fi
if [ -z "${PROFILE_ID}" ]; then
    echo "ESCAPE_PROFILE_ID is not set. Set ESCAPE_PROFILE_ID"
    exit 1
fi
if [ -z "${ESCAPE_API_KEY}" ]; then
    echo "ESCAPE_API_KEY is not set"
    exit 1
fi

# Update the schema if requested
if [ ! -z "${ESCAPE_SCHEMA}" ]; then
    echo "Updating schema"
    /usr/local/bin/escape-cli update-schema "${PROFILE_ID}" "${ESCAPE_SCHEMA}"
fi

# Setup args
_ARGS="scans start ${PROFILE_ID}"
if [ "${ESCAPE_WATCH}" = "true" ]; then
    _ARGS="${_ARGS} --watch"
fi
if [ ! -z "${ESCAPE_CONFIGURATION_OVERRIDE}" ]; then
    _ARGS="${_ARGS} --override ${ESCAPE_CONFIGURATION_OVERRIDE}"
fi

echo "Running scan:"
echo "escape-cli ${_ARGS}"
/usr/local/bin/escape-cli ${_ARGS}
