# Helm Charts

## Add Repo

```bash
helm repo add opsolving https://opsolving.github.io/charts
helm repo update
```

```bash
helm search repo opsolving
```

## Descriptions

### Tests

```bash
helm-unittest . -f tests/extra-manifests_test.yaml
```

## Naming Table

| Chart Name | .Release.Name | nameOverride | fullnameOverride | Resource Name      | Labels / Selecor                                                    |
|------------|---------------|--------------|------------------|--------------------|---------------------------------------------------------------------|
| extra      | extra         | -            | -                | extra-token        | app.kubernetes.io/instance: extra<br>app.kubernetes.io/name: extra  |
| extra      | extra         | foo          | -                | extra-foo-token    | app.kubernetes.io/instance: extra<br>app.kubernetes.io/name: foo    |
| extra      | extra         | -            | katana           | katana-token       | app.kubernetes.io/instance: extra<br>app.kubernetes.io/name: extra  |
| extra      | extra         | foo          | katana           | katana-token       | app.kubernetes.io/instance: extra<br>app.kubernetes.io/name: foo    |
| extra      | katana        |              |                  | katana-extra-token | app.kubernetes.io/instance: katana<br>app.kubernetes.io/name: extra |
| extra      | katana        | foo          |                  | katana-foo-token   | app.kubernetes.io/instance: katana<br>app.kubernetes.io/name: foo   |
| extra      | katana        |              | katana           | katana-token       | app.kubernetes.io/instance: katana<br>app.kubernetes.io/name: extra |
| extra      | katana        | foo          | katana           | katana-token       | app.kubernetes.io/instance: katana<br>app.kubernetes.io/name: foo   |
