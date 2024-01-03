package routes

import (
	"myapp/controllers"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Init() *echo.Echo {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "selamat datang di echo")
	})
	e.GET("/mahasiswa", controllers.DataMahasiswa)

	e.POST("/mahasiswa", controllers.SimpanController)
	e.PUT("/mahasiswa", controllers.UpdateMahasiswa)
	e.DELETE("/mahasiswa/:id", controllers.HapusData)
	return e
}
