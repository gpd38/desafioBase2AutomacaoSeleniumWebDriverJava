start java -jar selenium-server-4.2.2.jar -role hub -hubConfig HubConfig.json
start java -jar -Dwebdriver.chrome.driver="chromedriver.exe" -Dwebdriver.gecko.driver="geckodriver.exe" -Dwebdriver.edge.driver="msedgedriver.exe" -jar selenium-server-4.2.2.jar -role node -id node_1 -nodeConfig NodeDefaultConfig.json
