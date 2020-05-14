# 组件安装

## 镜像 
放置组件镜像到images文件下，文件后缀为tar

## 存储

```$xslt
{
  "volumes": [
    {
      "name": "component-app-pvc",  --挂载券名称
      "capacity": "10Gi" -- 挂载券容量
    }
  ],...
}
```

## 部署
参考component.yaml模板文件

## 可用服务变量

```$xslt
服务器IP
$serverIP

relax服务端口
#relaxPort

dbMaster服务端口
#dbMasterPort

dbSlave服务端口
#dbSlavePort
```



