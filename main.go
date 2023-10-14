package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Name string `json:"name"`
}

func Handler(_ context.Context, event MyEvent) (string, error) {
	fmt.Println("--->")
	fmt.Println("--->")
	fmt.Println("---> 🪬")
	fmt.Println("--->")
	fmt.Println("--->")
	return fmt.Sprintf("Hello, %s!", event.Name), nil
}

func main() {
	lambda.Start(Handler)
}
