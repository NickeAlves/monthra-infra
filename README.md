# monthra-infra

Infrastructure for Monthra: **Terraform** (IaC), the observability stack (**Prometheus, Grafana, Loki, Tempo, Alertmanager, OpenTelemetry Collector**), the compose file that runs the whole environment, and the shared release and CI/CD setup.

> Status: bootstrapping. The integrated compose and observability arrive in step 5 of the roadmap in [CLAUDE.md](CLAUDE.md); Terraform waits for the cloud provider decision.

## Getting started

Every Monthra compose file joins the external Docker network `monthra-net`. Create it once:

```bash
make network   # same as: docker network create monthra-net
```

## Related repositories

| Repository | Purpose |
|---|---|
| [monthra-server](https://github.com/NickeAlves/monthra-server) | Go API, MongoDB, Redis, auth, business rules, metrics and traces |
| [monthra-app](https://github.com/NickeAlves/monthra-app) | Flutter app (web, Android, iOS) |
| [monthra-infra](https://github.com/NickeAlves/monthra-infra) | Terraform, observability stack, integrated compose, CI/CD |

## Branches and deploys

- `main`: production. `staging`: homologation. `develop`: development. All three accept changes only through pull requests.
- Work on `feature/<name>` or `fix/<name>` branched from `develop`, then open a PR to `develop`.
- `develop` runs CI only; `staging` deploys to staging; a `vX.Y.Z` tag on `main` deploys to production (with approval).
- Commits follow [Conventional Commits](https://www.conventionalcommits.org/). Changes are recorded in [CHANGELOG.md](CHANGELOG.md).

## Contributing

Read [CLAUDE.md](CLAUDE.md) first. Never commit secrets, `.env`, `terraform.tfstate` or real `*.tfvars`.
