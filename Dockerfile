# Use the official Go image as the base image
FROM golang:1.21.6-alpine3.18

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the port that the application will run on (optional)
EXPOSE 8080

# Set the default values for CMD
CMD ["--domain", "default.com", "--port", "8080"]

# Command to run the application
ENTRYPOINT ["./main"]
