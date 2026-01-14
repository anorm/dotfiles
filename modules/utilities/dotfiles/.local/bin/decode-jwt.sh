#!/bin/bash

set -e

TOKEN=$(cat)
HEADER=$(   echo -n "$TOKEN" | ( cut -d. -f1; echo -n == ) | base64 -d)
PAYLOAD=$(  echo -n "$TOKEN" | ( cut -d. -f2; echo -n == ) | base64 -d)
SIGNATURE=$(echo -n "$TOKEN" | cut -d. -f3)

(
    echo -n '{'
    echo -n '"header":'
    echo -n "$HEADER"
    echo -n ","

    echo -n '"payload":'
    echo -n "$PAYLOAD"
    echo -n ","

    echo -n '"signature": "'
    echo -n "$SIGNATURE"
    echo -n '"'

    echo -n '}'
) | jq .
