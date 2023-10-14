
build-MyGoFunction:
	echo "😎 Compilando hijo de su chingada madre"
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -gcflags="-N -l" -o main main.go
	mv main $(ARTIFACTS_DIR)
	echo "😎 Fin de compilacion hijo de su chingada madre"

build-sam:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o dlv github.com/go-delve/delve/cmd/dlv
	sam build

debug-with-sam: build-sam
	
	# sam local generate-event sqs receive-message --body 'Test message' | sam local invoke -d 9999 \
	# --debug-args="-delveAPI=2" \
	# --debugger-path $${HOME}/go/bin/linux_amd64  MySQSQueueFunction --event 

	sam local invoke -d 9999 --event event.json --debugger-path ./ --debug-args="-delveAPI=2"