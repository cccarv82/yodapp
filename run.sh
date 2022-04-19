rm -rf report/*
robot -d ./report -v BROWSER:chromium -v HEADLESS:True tests/
