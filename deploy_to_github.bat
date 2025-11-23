@echo off
color 0A
echo ==========================================
echo       VitalLink Direct GitHub Deploy
echo ==========================================
echo.

:: --- CONFIGURE GIT (Local to this folder) ---
echo Configuring Git...
git config user.name "VitalLink Admin"
git config user.email "admin@vitallink.app"

echo.
echo [STEP 1] Create a Repo
echo 1. Open: https://github.com/new
echo 2. Name: "vital-link"
echo 3. Select: "Public"
echo 4. Click "Create repository"
echo.
echo [STEP 2] Copy the URL
echo Copy the HTTPS URL (e.g., https://github.com/YOUR_NAME/vital-link.git)
echo.
set /p repo_url="[PASTE URL HERE]: "

echo.
echo ------------------------------------------
echo 1. Initializing Repository...
git init
if %errorlevel% neq 0 goto ERROR

echo.
echo 2. Adding Files...
git add .
if %errorlevel% neq 0 goto ERROR

echo.
echo 3. Committing Files...
git commit -m "Initial Deploy"
:: Ignore error here if nothing to commit (already committed)

echo.
echo 4. Setting Branch...
git branch -M main

echo.
echo 5. Linking to GitHub...
git remote remove origin >nul 2>&1
git remote add origin %repo_url%
if %errorlevel% neq 0 goto ERROR

echo.
echo 6. Uploading... (Sign in if asked)
git push -u origin main
if %errorlevel% neq 0 goto ERROR

color 0A
echo.
echo ==========================================
echo             SUCCESS!
echo ==========================================
echo.
echo Your code is on GitHub.
echo Now enable GitHub Pages in Settings -> Pages.
echo.
pause
exit

:ERROR
color 0C
echo.
echo ==========================================
echo             ERROR OCCURRED
echo ==========================================
echo.
echo Please read the error message above.
echo Common fixes:
echo - Check your Internet connection.
echo - Make sure the GitHub URL is correct.
echo - If the repo isn't empty, delete it on GitHub and recreate it.
echo.
pause
