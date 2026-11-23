# Fasthop

[简体中文](README.zh-CN.md)

A Go and Gin web app for managing user stories, quotations and their attachments. The service bundles a web UI and provides APIs for account registration and login, managing stories and quotations, and uploading or downloading files and spreadsheets.

## Read the code

| Location | What it shows |
| --- | --- |
| [routes/api.go](routes/api.go) | The API route groups and JWT middleware for authenticated requests. |
| [app/middleware/limiter.go](app/middleware/limiter.go) | An in-memory token bucket for IP-based API rate limiting. |
| [app/services/jwt.go](app/services/jwt.go) | Token handling, including the Redis-backed logout denylist. |
| [bootstrap/db.go](bootstrap/db.go) | MySQL connection and model migrations using GORM. |
| [bootstrap/router.go](bootstrap/router.go) | The bundled UI, API mounting and HTTP server shutdown. |

## Run locally

1. Install Go 1.19+, MySQL 5.7+ and Redis 7.0+.
2. Create a local MySQL database, using [static/db/db_init.sql](static/db/db_init.sql) or the database name you choose for your local configuration. The service migrates its tables at startup.
3. Copy [config.yaml](config.yaml) to a local file outside the repository. Set local MySQL and Redis connection details, select local storage and point it at a test directory, and use a fresh JWT signing secret. Keep the configured database name in sync with the database you created.
4. Run from the repository root and open `http://localhost:8888` if you kept the default app port.

```sh
VIPER_CONFIG=/absolute/path/to/fasthop.local.yaml go run .
```

To build a binary, run `go build -o fasthop-quote-manager .`. Run it from the repository root so it can find its bundled web assets. On a Unix server with its own configuration, `VIPER_CONFIG=/absolute/path/to/fasthop.yaml nohup ./fasthop-quote-manager >out.log 2>&1 &` runs it in the background.

## License

MIT. See [LICENSE](LICENSE) for the copyright notice and terms.
