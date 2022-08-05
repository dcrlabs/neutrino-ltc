#!/usr/bin/env bash

LTCD_COMMIT=$(cat go.mod | \
        grep github.com/ltcsuite/ltcd | \
        tail -n1 | \
        awk -F " " '{ print $2 }' | \
        awk -F "/" '{ print $1 }')
echo "Fetching ltcd at $LTCD_COMMIT"

# NOTE: this is broken because ltcd's release tags have replaces, which go will
# refuse to go install!
pushd /tmp
GO111MODULE=on go install -v github.com/ltcsuite/ltcd@$LTCD_COMMIT
popd
