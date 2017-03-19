# dyndnsmasq-docker
Dockerfile for dnsmasq with automatic dynamic reloading of /etc/hosts.dyn

## What does it do?

Run `dnsmasq`, reading _only_ `/etc/hosts.dyn` and no upstream resolvers. As soon as the hostsfile is modified (inotify trigger `modify` or `create`), dnsmasq is signaled to reload the hostsfile. A quick and dirty poormans-dyndns.

## How to use?

Needs `NET_ADMIN` capability. `/etc/hosts.dyn` must be mounted read-only. Publish port 53 and 53/udp. Write stuff to hostsfile. magic.
