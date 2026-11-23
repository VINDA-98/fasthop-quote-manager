package bootstrap

import (
	"github.com/VINDA-98/fasthop-quote-manager/global"
	"github.com/jassue/go-storage/kodo"
	"github.com/jassue/go-storage/local"
	"github.com/jassue/go-storage/oss"
)

func InitializeStorage() {
	_, _ = local.Init(global.App.Config.Storage.Disks.Local)
	_, _ = kodo.Init(global.App.Config.Storage.Disks.QiNiu)
	_, _ = oss.Init(global.App.Config.Storage.Disks.AliOss)
}
