# Fasthop

[English](README.md)

用 Go 和 Gin 编写的报价管理应用。内置 Web 界面用于管理用户故事和报价，服务提供账户注册、登录、附件传输和 Excel 文件上传下载接口。

## 阅读代码

| 位置 | 内容 |
| --- | --- |
| [routes/api.go](routes/api.go) | API 路由分组及登录后使用的 JWT 中间件。 |
| [app/middleware/limiter.go](app/middleware/limiter.go) | 基于内存令牌桶的 API IP 限流。 |
| [app/services/jwt.go](app/services/jwt.go) | 令牌处理，包括登出时写入 Redis 的失效令牌。 |
| [bootstrap/db.go](bootstrap/db.go) | MySQL 连接及 GORM 模型迁移。 |
| [bootstrap/router.go](bootstrap/router.go) | 前端资源、API 挂载和 HTTP 服务关闭流程。 |

## 本地运行

1. 安装 Go 1.19+、MySQL 5.7+ 和 Redis 7.0+。
2. 用 [static/db/db_init.sql](static/db/db_init.sql) 创建本地 MySQL 数据库，也可以创建自己命名的数据库。服务启动时会迁移数据表。
3. 将 [config.yaml](config.yaml) 复制到仓库外的本地文件。填入本地 MySQL 和 Redis 连接信息，使用本地存储并指定测试目录，并生成本地 JWT 签名密钥。配置中的数据库名要与创建的数据库一致。
4. 在仓库根目录运行。使用默认端口时，打开 `http://localhost:8888`。

```sh
VIPER_CONFIG=/absolute/path/to/fasthop.local.yaml go run .
```

需要二进制文件时运行 `go build -o fasthop-quote-manager .`。从仓库根目录启动，这样程序才能找到前端资源。Unix 服务器可使用自己的配置，通过 `VIPER_CONFIG=/absolute/path/to/fasthop.yaml nohup ./fasthop-quote-manager >out.log 2>&1 &` 在后台运行。

## 许可证

MIT。版权声明和使用条款见 [LICENSE](LICENSE)。
