# Go parameters
GOCMD = go
GOTEST = $(GOCMD) test
DOCKER = docker

# Default target
all: test

# Run the application with the specified domain and optional port
run:
	$(GOCMD) run . --domain $(DOMAIN) $(if $(PORT),--port $(PORT),)

# Run tests
test:
	$(GOTEST) -v ./...

# Build and run the application using Docker
docker-run:
	$(DOCKER) build -t go-health .
	$(DOCKER) run -p 8080:8080 go-health $(if $(DOMAIN),--domain $(DOMAIN),) $(if $(PORT),--port $(PORT),)

.PHONY: all test run docker-run
