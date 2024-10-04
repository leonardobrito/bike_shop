# Use the official Elixir image as the base image
FROM elixir:1.15-alpine

# Install build dependencies and utilities
RUN apk add --no-cache build-base npm git bash inotify-tools postgresql-client

# Install Hex and Rebar (Elixir build tools)
RUN mix local.hex --force && mix local.rebar --force

# Set working directory inside the container
WORKDIR /app

# Copy the mix.exs and mix.lock files to install dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get

# Copy the entire app to the container
COPY . .

# Compile the Elixir project (dev environment)
RUN mix deps.compile

# Expose port 4000 for the Phoenix app
EXPOSE 4000

# Set environment variables
ENV MIX_ENV=dev
ENV PORT=4000
