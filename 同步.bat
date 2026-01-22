@echo off
chcp 65001 >nul
echo ==========================================
echo       正在同步笔记到 GitHub...
echo ==========================================
echo.

echo 1. 拉取远程最新更改 (Git Pull)...
git pull origin main
if %errorlevel% neq 0 (
    echo 错误: 拉取失败，请检查网络或冲突。
    pause
    exit /b %errorlevel%
)

echo.
echo 2. 添加本地更改 (Git Add)...
git add .

echo.
echo 3. 提交更改 (Git Commit)...
set "timestamp=%date% %time%"
git commit -m "Sync notes: %timestamp%"

echo.
echo 4. 推送到远程仓库 (Git Push)...
git push origin main
if %errorlevel% neq 0 (
    echo 错误: 推送失败。
    pause
    exit /b %errorlevel%
)

echo.
echo ==========================================
echo       同步完成! (Sync Completed)
echo ==========================================
echo.
pause
