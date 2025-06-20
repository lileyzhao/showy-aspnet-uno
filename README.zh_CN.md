# showy-aspnet-uno
<!-- markdownlint-disable MD033 -->
<p align='center'>
<a href="README.md">English</a> | <b>简体中文</b>
</p>

这个项目旨在构建一个基于 ASP.NET 和 LibreOffice 的 Docker 基础镜像，使得 ASP.NET 应用程序可以轻松调用 LibreOffice 的文档处理和转换功能。基于 `mcr.microsoft.com/dotnet/aspnet:8.0` 构建。

项目提供了一个现成的镜像 `lileyzhao/showy-aspnet-uno`，你可以直接使用，也可以自行构建并推送到自己的镜像库。

镜像的 Docker Hub 链接为：[lileyzhao/showy-aspnet-uno](https://hub.docker.com/r/lileyzhao/showy-aspnet-uno)。

## 🚀 使用镜像

你可以直接替换ASP.NET项目的Dockerfile内容 (最新更新: `2025-06-01 08:27:39`)：

```dockerfile
# FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
# 替换为 lileyzhao/showy-aspnet-uno 即可
FROM lileyzhao/showy-aspnet-uno:8.0 AS base
USER app
WORKDIR /app
```

## 📄 在 ASP.NET 应用程序中使用 LibreOffice

以下是一个简单的示例，展示如何在 ASP.NET 应用程序中调用 LibreOffice 将文档转换为 PDF：

```csharp
using System.Diagnostics;

public void ConvertToPdf(string inputFile, string outputFile)
{
    var process = new Process
    {
        StartInfo = new ProcessStartInfo
        {
            FileName = "libreoffice",
            Arguments = $"--headless --convert-to pdf --outdir {Path.GetDirectoryName(outputFile)} {inputFile}",
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true,
        }
    };
    process.Start();
    process.WaitForExit();
}
```

## 🔨 自行构建（可选）

如果你想使用自己的镜像仓库，可以按照以下步骤构建包含 ASP.NET 和 LibreOffice 的 Docker 镜像。

### 前提条件

确保您的系统上已经安装 Docker。您可以从 [这里](https://www.docker.com/products/docker-desktop) 下载 Docker。

### 构建 Docker 镜像

克隆仓库并导航到项目目录：

```sh
git clone https://github.com/lileyzhao/showy-aspnet-uno.git
cd showy-aspnet-uno
```

使用 `pnpm` 构建 Docker 镜像：

```sh
pnpm build
```

### 推送到自己的镜像库

构建完成后，你可以将镜像推送到自己的 Docker 镜像库：

```sh
docker tag showy-aspnet-uno your-docker-repo/showy-aspnet-uno
docker push your-docker-repo/showy-aspnet-uno
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=lileyzhao/showy-aspnet-uno&type=Date)](https://star-history.com/#lileyzhao/showy-aspnet-uno&Date)

---

祝您编码愉快！🚀
