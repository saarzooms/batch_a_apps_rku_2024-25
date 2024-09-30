@echo off
for /d %%i in (*) do (
  cd "%%i"
  if exist "build" (
    echo Cleaning build directory in %%i
    flutter clean
  ) else (
    echo Skipping %%i as build directory does not exist
  )
  cd ..
)
