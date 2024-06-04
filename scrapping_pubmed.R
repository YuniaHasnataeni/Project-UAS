library(rvest)
library(httr)
library(mongolite)

# URL halaman PubMed dengan pencarian "SVM"
url <- "https://pubmed.ncbi.nlm.nih.gov/?term=SVM"

# Membuat fungsi untuk melakukan scraping
scrape_pubmed <- function(url) {
  # Mendapatkan konten HTML dari URL
  page <- GET(url)
  # Memeriksa apakah permintaan berhasil
  if (status_code(page) == 200) {
    # Mendapatkan konten HTML
    page_content <- read_html(content(page, "text"))
    # Mengambil judul, link, dan penulis
    titles <- page_content %>% html_nodes(".docsum-title") %>% html_text()
    links <- page_content %>% html_nodes(".docsum-title") %>% html_attr("href")
    authors <- page_content %>% html_nodes(".docsum-authors") %>% html_text()
    # Menggabungkan hasil dalam dataframe
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

# Memanggil fungsi untuk melakukan scraping
pubmed_data <- scrape_pubmed(url)

# Melihat hasil scraping
print(pubmed_data)

# Membuang koneksi
rm(url, scrape_pubmed)

# MONGODB
message('Input Data to MongoDB Atlas')

# Connection string dari MongoDB Atlas
conn_string <- Sys.getenv("ATLAS_URL")

# Membuat koneksi ke MongoDB Atlas
atlas_conn <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db = Sys.getenv("ATLAS_DB"),
  url = conn_string
)

# Memasukkan data ke MongoDB Atlas
atlas_conn$insert(pubmed_data)

# Menutup koneksi setelah selesai
rm(atlas_conn)