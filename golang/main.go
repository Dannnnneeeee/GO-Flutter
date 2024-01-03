package main

import (
	"myapp/db"
	routes "myapp/routes"
)

func main() {
	db.Init()

	e := routes.Init()
	e.Logger.Fatal(e.Start(":2168"))
}
