package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
)

type Product struct {
	ID          int
	ImageURL    string
	Name        string
	Description string
	Price       float64
	IsFavourite bool
	IsInCart    bool
	Quantity    int
}

type User struct {
	ID    int
	Image string
	Name  string
	Phone string
	Mail  string
}

var products = []Product{{
	ID:          0,
	ImageURL:    "https://sun9-77.userapi.com/s/v1/ig2/cMV3VvAcPf4N1FeW_2ru76eaR2JyN5ioLTN-ckEBQabCuzI7-v-AtorstsBXo8lTjLB8BLO_NVMnK6ncbQOmE1v7.jpg?quality=95&as=32x31,48x46,72x70,108x104,160x155,240x232,360x348,480x464,540x522,640x619,720x696,1080x1044,1280x1238,1440x1392,2474x2392&from=bu&u=CKb5C2bKO3VK8-SHWwqaKZimILqYuOJcc0hesn0J4Lc&cs=604x584",
	Name:        "Деревянные киты - Всё, что я хочу тебе сказать (Black)",
	Description: "Формат: 12' \nLP Жанр: shoegaze, dream pop \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
	Price:       2900,
	IsFavourite: false,
	IsInCart:    false,
	Quantity:    0,
},
	{
		ID:          1,
		ImageURL:    "https://sun9-3.userapi.com/s/v1/ig2/qNLTFSDcG2KiUC1qw7fTfA4O6FX_AUrfuLtSvT3GqmQHORFXu5F0YKPuZQwnhYMFD_H4fAAt1J2Zz39ITwCQlplQ.jpg?quality=95&as=32x31,48x46,72x70,108x104,160x155,240x232,360x348,480x464,540x522,640x619,720x696,1080x1044,1280x1238,1440x1392,2474x2392&from=bu&u=p3C0iTNx0MVFWM2op7y56531P_gUaomY3cDX2MZ8AqE&cs=604x584",
		Name:        "Петар Мартич - Петар",
		Description: "Формат: 10' \nLP Жанр: rap, hip-hop \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
		Price:       4000,
		IsFavourite: false,
		IsInCart:    false,
		Quantity:    0,
	},
	{
		ID:          2,
		ImageURL:    "https://sun9-65.userapi.com/s/v1/ig2/kh-0mRLG27Sp5a9JAnVfhhZpd3cW5uhaqT-7YCk6mzLoT2ZjOMJ8CO3RiOitBamTTweNWT6wqIc0D1CG5ShFMUoh.jpg?quality=95&as=32x31,48x46,72x70,108x104,160x155,240x232,360x348,480x464,540x522,640x618,720x696,1080x1044,1280x1237&from=bu&u=QPp-bGXINzC0cu62gkq0WBiVFzUyQjt_aeOLEl-BJcE&cs=604x584",
		Name:        "4 Позиции Бруно - Весёлые старты (GREEN)",
		Description: "Формат: 10' \nLP Жанр: electronic, ambient \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
		Price:       3000,
		IsFavourite: false,
		IsInCart:    false,
		Quantity:    0,
	},
	{
		ID:          3,
		ImageURL:    "https://sun9-78.userapi.com/s/v1/ig2/TZJfGR2z8aRR0kGgeMet7h6MLIpsnvdlIbf85_uVKB9cPseahF3zksDN0YOe4iZSGNfr2RbMcRmefas9FeqPbE6q.jpg?quality=95&as=32x31,48x46,72x70,108x104,160x155,240x232,360x348,480x464,500x483&from=bu&u=P4yGKkm_zHjMGgW4WnQt8n5YqaDv-pYkM7T0PfbSr_8&cs=500x483",
		Name:        "Bird Bone - Лейтмотив",
		Description: "Формат: 10' \nLP Жанр: emo \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
		Price:       3500,
		IsFavourite: false,
		IsInCart:    false,
		Quantity:    0,
	}}

func getProductsHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(products)
}

// обработчик для POST-запроса, добавляет продукт
func createProductHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	var newProduct Product
	err := json.NewDecoder(r.Body).Decode(&newProduct)
	if err != nil {
		fmt.Println("Error decoding request body:", err)
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	fmt.Printf("Received new Product: %+v\n", newProduct)
	var lastID int = len(products)

	for _, productItem := range products {
		if productItem.ID > lastID {
			lastID = productItem.ID
		}
	}
	newProduct.ID = lastID + 1
	products = append(products, newProduct)

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(newProduct)
}

//Добавление маршрута для получения одного продукта

func getProductByIDHandler(w http.ResponseWriter, r *http.Request) {
	// Получаем ID из URL
	idStr := r.URL.Path[len("/Products/"):]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid Product ID", http.StatusBadRequest)
		return
	}

	// Ищем продукт с данным ID
	for _, Product := range products {
		if Product.ID == id {
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(Product)
			return
		}
	}

	// Если продукт не найден
	http.Error(w, "Product not found", http.StatusNotFound)
}

// удаление продукта по id
func deleteProductHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodDelete {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	// Получаем ID из URL
	idStr := r.URL.Path[len("/Products/delete/"):]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid Product ID", http.StatusBadRequest)
		return
	}

	// Ищем и удаляем продукт с данным ID
	for i, Product := range products {
		if Product.ID == id {
			// Удаляем продукт из среза
			products = append(products[:i], products[i+1:]...)
			w.WriteHeader(http.StatusNoContent) // Успешное удаление, нет содержимого
			return
		}
	}

	// Если продукт не найден
	http.Error(w, "Product not found", http.StatusNotFound)
}

func main() {
	http.HandleFunc("/products", getProductsHandler)
	http.HandleFunc("/products/create", createProductHandler)
	http.HandleFunc("/products/", getProductByIDHandler)
	http.HandleFunc("/products/delete/", deleteProductHandler)

	fmt.Println("Сервер запущен на порте 8080")
	http.ListenAndServe(":8080", nil)
}
