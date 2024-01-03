package controllers

import (
	"myapp/models"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
)

func DataMahasiswa(c echo.Context) error {
	result, err := models.DataMahasiswa()

	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"Message": err.Error()})
	}
	return c.JSON(http.StatusOK, result)
}

func SimpanController(c echo.Context) error {
	npm := c.FormValue("npm")
	username := c.FormValue("username")
	kelas := c.FormValue("kelas")

	result, err := models.SimpanData(npm, username, kelas)

	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
	}
	return c.JSON(http.StatusOK, result)
}
func UpdateMahasiswa(c echo.Context) error {
	id := c.FormValue("id")
	npm := c.FormValue("npm")
	username := c.FormValue("username")
	kelas := c.FormValue("kelas")

	conv_id, err := strconv.Atoi(id)

	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	result, err := models.UpdateMahasiswa(conv_id, npm, username, kelas)

	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
	}
	return c.JSON(http.StatusOK, result)
}
func HapusData(c echo.Context) error {
	id := c.Param("id")

	conv_id, err := strconv.Atoi(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	result, err := models.HapusData(conv_id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
	}
	return c.JSON(http.StatusOK, result)
}
