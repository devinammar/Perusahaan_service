// service-go (Go - CRUD penjualan)

// main.go
package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

type Penjualan struct {
	ID      int     `json:"id"`
	Produk  string  `json:"produk"`
	Jumlah  int     `json:"jumlah"`
	Total   float64 `json:"total"`
}

var db *sql.DB

func initDB() {
	var err error
	dsn := "root:rootpass@tcp(db:3306)/perusahaan"
	db, err = sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}
	if err = db.Ping(); err != nil {
		log.Fatal(err)
	}
}

func getPenjualan(w http.ResponseWriter, r *http.Request) {
	rows, err := db.Query("SELECT * FROM penjualan")
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	defer rows.Close()

	var data []Penjualan
	for rows.Next() {
		var p Penjualan
		err := rows.Scan(&p.ID, &p.Produk, &p.Jumlah, &p.Total)
		if err != nil {
			http.Error(w, err.Error(), 500)
			return
		}
		data = append(data, p)
	}
	json.NewEncoder(w).Encode(data)
}

func createPenjualan(w http.ResponseWriter, r *http.Request) {
	var p Penjualan
	json.NewDecoder(r.Body).Decode(&p)
	_, err := db.Exec("INSERT INTO penjualan (produk, jumlah, total) VALUES (?, ?, ?)", p.Produk, p.Jumlah, p.Total)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	json.NewEncoder(w).Encode(map[string]string{"message": "Data ditambahkan"})
}

func updatePenjualan(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(mux.Vars(r)["id"])
	var p Penjualan
	json.NewDecoder(r.Body).Decode(&p)
	_, err := db.Exec("UPDATE penjualan SET produk=?, jumlah=?, total=? WHERE id=?", p.Produk, p.Jumlah, p.Total, id)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	json.NewEncoder(w).Encode(map[string]string{"message": "Data diperbarui"})
}

func deletePenjualan(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(mux.Vars(r)["id"])
	_, err := db.Exec("DELETE FROM penjualan WHERE id=?", id)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	json.NewEncoder(w).Encode(map[string]string{"message": "Data dihapus"})
}

func main() {
	initDB()
	r := mux.NewRouter()
	r.HandleFunc("/penjualan", getPenjualan).Methods("GET")
	r.HandleFunc("/penjualan", createPenjualan).Methods("POST")
	r.HandleFunc("/penjualan/{id}", updatePenjualan).Methods("PUT")
	r.HandleFunc("/penjualan/{id}", deletePenjualan).Methods("DELETE")

	http.ListenAndServe(":8080", r)
}
