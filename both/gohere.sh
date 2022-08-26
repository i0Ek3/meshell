#!/bin/bash

echo "

       Create Go Standard Project Structure
    ==========================================
     This script will create following folders:
    ==========================================

        configs：配置文件
        docs：文档集合
        global：全局变量
        internal：内部模块
            dao：数据访问层，所有与数据相关的操作都会在 dao 层进行，例如 MySQL、ElasticSearch 等
            middleware：HTTP 中间件
            model：模型层，用于存放 model 对象
            routers：路由相关逻辑处理
            service：项目核心业务逻辑
        pkg：项目相关的模块包
        storage：项目生成的临时文件
        scripts：各类构建、安装、分析等操作的脚本
        third_party：第三方的资源工具，如 Swagger UI 等

    =============================================
     How-To? Run command: $0 project_name.
    =============================================
"

sleep 5

echo "
    =================    
     Creating $1...
    ================
"

mkdir $1 ; cd $1
mkdir {configs,docs,global,internal,pkg,storage,scripts,third_party}
mkdir internal/{dao,middleware,model,routers,service}

echo "
    ==========    
     All done!
    ==========   
"
