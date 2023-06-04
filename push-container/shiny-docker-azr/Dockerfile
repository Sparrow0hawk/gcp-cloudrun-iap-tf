# Install R version 3.5
FROM rocker/shiny

# Install Ubuntu packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean


# Copy configuration files into the Docker image
COPY . /app


# Make the ShinyApp available at port 80
EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 3838)"]
