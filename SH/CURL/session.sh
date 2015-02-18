echo chrome
curl -i --data '{"desiredCapabilities":{"browserName":"chrome","version":"","platform":"ANY","javascriptEnabled":true}}' http://localhost:4444/wd/hub/session
echo

