package models

import (
	"myapp/db"
	"net/http"
)

type Mahasiswa struct {
	Id       int    `json:"id"`
	Npm      string `json:"npm"`
	Username string `json:"username"`
	Kelas    string `json:"kelas"`
}

func DataMahasiswa() (Response, error) {
	var obj Mahasiswa
	var arrobj []Mahasiswa
	var res Response

	con := db.CreateCon()
	sqlStatement := "SELECT * FROM mahasiswa"

	rows, err := con.Query(sqlStatement)
	defer rows.Close()

	if err != nil {
		return res, err
	}
	for rows.Next() {
		err = rows.Scan(&obj.Id, &obj.Npm, &obj.Username, &obj.Kelas)

		if err != nil {
			return res, err
		}
		arrobj = append(arrobj, obj)
	}
	res.Status = http.StatusOK
	res.Message = "success"
	res.Data = arrobj

	return res, nil

}

func SimpanData(npm string, username string, kelas string) (Response, error) {

	var res Response

	con := db.CreateCon()
	sqlStatement := "INSERT INTO mahasiswa (npm,username,kelas) VALUES(?,?,?)"

	stmt, err := con.Prepare(sqlStatement)
	if err != nil {
		return res, err
	}
	result, err := stmt.Exec(npm, username, kelas)

	if err != nil {
		return res, err
	}
	getIdLast, err := result.LastInsertId()
	if err != nil {
		return res, err
	}
	res.Status = http.StatusOK
	res.Message = "success"
	res.Data = map[string]int64{
		"getIdLast": getIdLast,
	}
	return res, nil
}

func UpdateMahasiswa(id int, npm string, username string, kelas string) (Response, error) {
	var res Response

	con := db.CreateCon()
	sqlStatement := "UPDATE mahasiswa SET npm = ?, username = ?, kelas = ? WHERE id = ?"
	stmt, err := con.Prepare(sqlStatement)
	if err != nil {
		return res, err
	}

	result, err := stmt.Exec(npm, username, kelas, id)

	if err != nil {
		return res, err
	}

	rowsAffected, err := result.RowsAffected()
	if err != nil {
		return res, err
	}
	res.Status = http.StatusOK
	res.Message = "success"
	res.Data = map[string]int64{
		"rows": rowsAffected,
	}

	return res, nil
}
func HapusData(id int) (Response, error) {
	var res Response

	con := db.CreateCon()
	sqlStatement := "DELETE FROM mahasiswa WHERE id = ?"
	stmt, err := con.Prepare(sqlStatement)
	if err != nil {
		return res, err
	}
	defer stmt.Close()

	_, err = stmt.Exec(id)
	if err != nil {
		return res, err
	}

	// Setelah menghapus data, atur ulang auto increment ke 0 pada kolom 'id'
	resetAutoIncrement := "ALTER TABLE mahasiswa AUTO_INCREMENT = 0"
	_, err = con.Exec(resetAutoIncrement)
	if err != nil {
		return res, err
	}

	res.Status = http.StatusOK
	res.Message = "success"
	return res, nil
}
