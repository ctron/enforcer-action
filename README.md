# Seedwing Enforcer Action

GitHub Action for the Seedwing enforcer

## Usage

```yaml
- uses actions/checkout@v3
- name: Apply company policies
  uses: seedwing-io/enforcer-action@v1
  with:
    policy-dir: policies
    enforcer-config: .enforcer.yaml
    source: pom.xml
```

Policy file `policy.dog` example :

```
pattern not-vulnerable = {
    purl: uri::purl(osv::scan-purl(openvex::from-osv(openvex::not-affected)))
}
```

Enforcer config file `.enforcer.yaml` :

```yaml
dependencies:
  policy: ./policy.dog
  requires: "not-vulnerable"
```
