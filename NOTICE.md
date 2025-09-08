Copyright &copy; 2025 Opsolving. The term "Opsolving" refers to Opsolving and/or its subsidiaries.
SPDX-License-Identifier: APACHE-2.0

---

# NOTICE

This repository contains Helm charts maintained by Opsolving, as well as
Helm charts that are based on third-party open source projects.

## Opsolving Charts

All original charts and code authored by Opsolving are licensed under the terms
described in the root `LICENSE.md` file.

## Charts Derived from Bitnami

The following charts are copies or derivative works based on the Bitnami Helm charts:

- cassandra
- common
- ejbca
- kafka
- keycloak
- memcached
- mongodb
- postgresql
- rabbitmq
- redis
- redis-cluster
- tomcat
- wildfly
- zookeeper

These charts are licensed under the Apache License 2.0, with copyright held
by Broadcom Inc. and/or its subsidiaries, as specified in the LICENSE.md files
contained within their respective directories.

### Only latest helm charts grabbed just before `2025-08-27T23:59:59Z`

```bash
START="2025-01-01T00:00:00Z"
CUTOFF="2025-08-27T23:59:59Z"

( printf "NAME\tCHART VERSION\tAPP VERSION\tCREATED\n" ;
  curl -s https://repo.broadcom.com/bitnami-files/index.yaml \
  | yq e -r "
      .entries
      | to_entries
      | .[]
      | .key as \$name
      | (
          .value
          | map(select((.created >= \"$START\") and (.created <= \"$CUTOFF\")))
          | sort_by(.created)
          | reverse
          | .[0]
        ) as \$last
      | select(\$last)
      | [\$name, \$last.version, (\$last.appVersion // \"-\"), \$last.created]
      | @tsv
    " \
  | sort -k1 ) \
| column -ts $'\t' \
    | grep -Ei "redis-cluster|redis|phpmyadmin|kafka|zookeeper|logstash|rabbitmq|redpanda|keycloak|keydb|tomcat|wildfly|openldap|ejbca|cassandra|memcached|nginx|mariadb|postgresql" \
    | grep -Eiv "rabbitmq-cluster-operator|nginx-ingress-controller|postgresql-ha|mariadb-galera"
```

For details on third-party licenses, see the `LICENSE.md` file inside each
chart directory.
