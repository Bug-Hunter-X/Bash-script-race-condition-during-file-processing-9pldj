This repository contains a bash script demonstrating a race condition during file processing. The script attempts to read and process a file, then remove it in a loop.  However, if another process modifies or removes the file concurrently, the script may encounter unexpected behavior such as missing content or errors.  The solution addresses this by using file locking to prevent concurrent access.