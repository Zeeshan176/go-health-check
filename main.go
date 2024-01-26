package main

import (
	"fmt"
	"log"
	"os"

	"github.com/urfave/cli/v2"
)

/*
Main function is used for create app from cli to check health check of domains.

@author Mohammad Zeeshan
@date January 26, 2024
*/
func main() {
	app := &cli.App{
		Name:  "HealthChecker",
		Usage: "A simple tool that checks whether a website is running or is down",
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:     "domain",
				Aliases:  []string{"d"},
				Usage:    "Domain name to check.",
				Required: true,
			},
			&cli.StringFlag{
				Name:     "port",
				Aliases:  []string{"p"},
				Usage:    "Port number to check.",
				Required: false,
			},
		},
		Action: func(c *cli.Context) error {
			port := c.String("port")
			// Check if the "port" flag is set by the user
			if !c.IsSet("port") {
				port = "80"
			}
			status := Check(c.String("domain"), port)
			fmt.Println(status)
			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
