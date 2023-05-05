FROM golang 
COPY . .
RUN go build dispatcher.go
CMD ["./dispatcher"]
EXPOSE 80

