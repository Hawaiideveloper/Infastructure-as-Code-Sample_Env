### Kill the running instances if you get issues:
pgrep -f vagrant && kill -9 $(pgrep -f vagrant)
lsof -t -i:8080 && sudo kill -9 $(lsof -t -i:8080)
