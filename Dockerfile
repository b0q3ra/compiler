# Stage 1: Build stage with Alpine
FROM alpine:latest AS build

# Install build-base which includes g++ and make
RUN apk add --no-cache build-base

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY ./ ./


# Compile the C++ code statically to ensure it doesn't depend on runtime libraries
# RUN g++ -o bin/main main.cpp -static
RUN make
RUN ls -R /app

# # Stage 2: Runtime stage
# FROM scratch

# # Copy the static binary from the build stage
# COPY --from=build /app/bin/main /bin/main

# Command to run the binary when the container starts
CMD ["/app/bin/main"]

