# Debian Sources Update Resource

A Concourse CI resource to check for updated Debian and Ubuntu compatible package sources.

## Source Configuration

- `arch`: *Optional.* The architecture to check for updates. Defaults to `amd64`.

- `sources`: *Required.* A list of sources to check for updates, in `sources.list` deb line format.

## Example

This pipeline will check the Ubuntu updates and security repositories every hour, triggering the next step of the build plan if there are any changes.

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
    arch: i386
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
