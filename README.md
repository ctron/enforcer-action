# Seedwing Enforcer Action

GitHub Action for the Seedwing enforcer.

## Usage

```yaml
- uses: actions/checkout@v3
- name: Enforce Seedwing policies
  uses: seedwing-io/enforcer-action@v1
  
- name: Enforce Seedwing policies (with a different root)
  uses: seedwing-io/enforcer-action@v1
  with:
    root: ./sub-project
```

Policy file `policy.dog` example:

```
pattern not-vulnerable = {
    purl: uri::purl(osv::scan-purl(openvex::from-osv(openvex::not-affected)))
}
```

Enforcer config file `.enforcer.yaml`:

```yaml
dependencies:
  policy: ./policy.dog
  requires: "not-vulnerable"
```
