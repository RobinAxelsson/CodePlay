#!/usr/bin/env bash

### Security looks for same passwords as in the Keychain GUI

# security add-generic-password -T "" -a <associated-account> -s <key/service-name> -w <insecure with args>

# security find-generic-password -w -a <associated-account> -s <key/service-name>
