# showy-aspnet-uno
<!-- markdownlint-disable MD033 -->
<p align='center'>
<b>English</b> | <a href="README.zh-CN.md">简体中文</a>
</p>

This project provides a Docker image based on ASP.NET and LibreOffice, enabling ASP.NET applications to easily utilize LibreOffice for document processing and conversion. Built on `mcr.microsoft.com/dotnet/aspnet:8.0`.

A pre-built image, `lileyzhao/showy-aspnet-uno`, is available for use. You can either use this image directly or build and push it to your own repository.

The Docker Hub link for the image is: [lileyzhao/showy-aspnet-uno](https://hub.docker.com/r/lileyzhao/showy-aspnet-uno).

## 🚀 Using the Image

You can directly replace the ASP.NET Dockerfile (Last updated: `2025-02-01 08:23:16`):

```dockerfile
# FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
# Replace with lileyzhao/showy-aspnet-uno
FROM lileyzhao/showy-aspnet-uno:8.0 AS base
USER app
WORKDIR /app
```

## 📄 Using LibreOffice in an ASP.NET Application

Here is a simple example showing how to call LibreOffice in an ASP.NET application to convert documents to PDF:

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

## 🔨 Building the Image Yourself ( Optional )

If you want to use your own image repository, you can follow these steps to build a Docker image that includes ASP.NET and LibreOffice.

### Prerequisites

Ensure Docker is installed on your system. You can download Docker from [here](https://www.docker.com/products/docker-desktop).

### Building the Docker Image

Clone the repository and navigate to the project directory:

```sh
git clone https://github.com/lileyzhao/showy-aspnet-uno.git
cd showy-aspnet-uno
```

Build the Docker image using `pnpm`:

```sh
pnpm build
```

### Pushing to Your Own Repository

After building, you can push the image to your own Docker repository:

```sh
docker tag showy-aspnet-uno your-docker-repo/showy-aspnet-uno
docker push your-docker-repo/showy-aspnet-uno
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=lileyzhao/showy-aspnet-uno&type=Date)](https://star-history.com/#lileyzhao/showy-aspnet-uno&Date)

---

Happy coding! 🚀
