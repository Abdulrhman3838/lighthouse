#!/usr/bin/env bash

##
# @license Copyright 2022 The Lighthouse Authors. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
##

set -eux

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LH_ROOT="$SCRIPT_DIR/../.."

ARGS=(
  --testMatch='{flow-report/**/*-test.ts,flow-report/**/*-test.tsx}'
  --require="$LH_ROOT/flow-report/test/setup/env-setup.ts"
)

cd "$LH_ROOT"
node --loader=@esbuild-kit/esm-loader lighthouse-core/test/scripts/run-mocha-tests.js ${ARGS[*]} "$@"
