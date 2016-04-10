# Debian Sources Update Resource

A Concourse CI resource to check for updated Debian and Ubuntu compatible package sources.

### Source Configuration

- `sources`: *Required.* A list of Debian sources to be checked for updates, in `sources.list` deb line format.

### Example

```yaml
resource_types:
- name: debian-sources
  type: docker-image
  source:
    repository: jdub/debian-sources-resource

resources:
- name: ubuntu-sources
  type: debian-sources
  check_every: 1h
  source:
    sources:
    - deb http://au.archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
    - deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse

jobs:
- name: update-packages
  plan:
  - get: ubuntu-sources
    trigger: true
  - task: build-fresh-image
    ...
```
