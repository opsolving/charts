## Copyright Opsolving. All Rights Reserved.
## SPDX-License-Identifier: APACHE-2.0

#!/bin/bash

set -euo pipefail

rm -rf docs/
mkdir -p docs

find . -type d -name charts -exec rm -rf {} +

for chart in opsolving/*/; do
  helm dependency update "$chart" || true
  helm package "$chart" -d docs
done

helm repo index docs --url https://opsolving.github.io/charts

git add .
git commit -am "init"
git push
