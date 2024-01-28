# Simple Health Checker

This project is used for website is down or up based on cli command

## Installation

Make sure you have Go installed on your machine. Clone the repository and run:
# for using make use the make commands
```bash
go get -u github.com/Zeeshan176/go-health-check

go run . --domain/-d ["domainname"]
go run . --port/-p ["localport"] --domain localhost

make run DOMAIN=["domain-name"]
make docker-run DOMAIN=["pixelque.com"] PORT=["8081"]
```
