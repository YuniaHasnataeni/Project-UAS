library(rvest)
library(httr)
library(mongolite)

# Fungsi untuk membaca nomor halaman terakhir dari file
read_last_page <- function() {
  if (file.exists("last_page.txt")) {
    return(as.integer(readLines("last_page.txt")))
  } else {
    return(1)
  }
}

# Fungsi untuk menyimpan nomor halaman terakhir ke file
write_last_page <- function(page_number) {
  writeLines(as.character(page_number), "last_page.txt")
}

# Fungsi untuk melakukan scraping
scrape_pubmed <- function(url) {
  page <- GET(url)
  if (status_code(page) == 200) {
    page_content <- read_html(content(page, "text"))
    titles <- page_content %>% html_nodes(".docsum-title") %>% html_text(trim = TRUE) %>% head(10)
    links <- page_content %>% html_nodes(".docsum-title") %>% html_attr("href") %>% head(10)
    authors <- page_content %>% html_nodes(".docsum-authors") %>% html_text(trim = TRUE) %>% head(10)
    data <- data.frame(
      title = titles,
      author = authors,
      link = paste0("https://pubmed.ncbi.nlm.nih.gov", links),
      stringsAsFactors = FALSE
    )
    return(data)
  } else {
    print("Gagal mengambil halaman")
    return(NULL)
  }
}

# Membaca nomor halaman terakhir
last_page <- read_last_page()

# URL halaman PubMed dengan pencarian "SVM" dan halaman tertentu
url <- paste0("https://pubmed.ncbi.nlm.nih.gov/?term=SVM&page=", last_page)

# Memanggil fungsi untuk melakukan scraping
pubmed_data <- scrape_pubmed(url)
if (!is.null(pubmed_data)) {
  print(pubmed_data)
  
  # MONGODB
  message('Input Data to MongoDB Atlas')
  
  # Membuat koneksi ke MongoDB Atlas
  atlas_conn <- mongo(
    collection = Sys.getenv("ATLAS_COLLECTION"),
    db         = Sys.getenv("ATLAS_DB"),
    url        = Sys.getenv("ATLAS_URL")
  )
  
  # Memasukkan data ke MongoDB Atlas
  atlas_conn$insert(pubmed_data)
  
  # Menutup koneksi setelah selesai
  rm(atlas_conn)
  
  # Memperbarui nomor halaman terakhir
  write_last_page(last_page + 1)
} else {
  print("Tidak ada data untuk dimasukkan ke MongoDB.")
}

# Membuang variabel yang tidak diperlukan
rm(url, scrape_pubmed, last_page, pubmed_data, read_last_page, write_last_page)
