<p align="center" width="80%">
    <img width="60%" src="https://github.com/YuniaHasnataeni/Project-UAS/blob/main/logo.png">
</p>

<div align="center">
    
# United States National Library of Medicine (NLM)
[![scrape_hashtag](https://github.com/YuniaHasnataeni/Project-UAS/actions/workflows/main.yml/badge.svg)](https://github.com/YuniaHasnataeni/Project-UAS/actions/workflows/main.yml)

<p align="center">

# Menu:

</p>

[Tentang](#Tentang)
•
[Deskripsi](#Deskripsi)
•
[MongoDB](#MongoDB)
•
[RPubs](#RPubs)
•
[PPT](#PPT)
•
[Pengembang](#Pengembang)

</div>

## ℹ️: Tentang  

**Apa sih PubMed itu?**

<p align="justify">
PubMed adalah sumber daya gratis yang mendukung pencarian literatur ilmiah dalam bidang biomedis dan kesehatan. PubMed mencakup lebih dari 30 juta kutipan dan abstrak dari artikel jurnal biomedis. Ini adalah alat penting bagi para peneliti, dokter, dan profesional kesehatan untuk menemukan penelitian terbaru dan informasi medis yang relevan.
</p>

## 📝: Deskripsi

<p align="justify">
Pada project ini, saya melakukan scraping pada situs web https://pubmed.ncbi.nlm.nih.gov/ untuk mengumpulkan artikel jurnal yang menggunakan metode Support Vector Machine (SVM). SVM adalah salah satu metode pembelajaran mesin yang sangat populer dan digunakan untuk klasifikasi dan regresi. Tujuan utama dari scraping ini adalah untuk mengumpulkan data penelitian terbaru yang menggunakan metode SVM dan memudahkan analisis data dari berbagai studi yang dipublikasikan.
</p>

<p align="justify">
Dengan melakukan scraping data dari PubMed, kita bisa mendapatkan berbagai informasi penting seperti id, judul artikel jurnal, penulis, dan link. Data ini sangat berguna untuk keperluan penelitian, review literatur, dan analisis tren penggunaan SVM dalam berbagai bidang biomedis dan kesehatan.
</p>
</div>

## 💾: MongoDB

Berikut adalah salah satu contoh dokumen di MongoDB untuk artikel PubMed dengan metode SVM:
```mongodb
{
  "_id": {
    "$oid": "665fdaabbf2c72d2a006cf91"
  },
  "title": "Applications of Support Vector Machine (SVM) Learning in Cancer Genomics.",
  "author": "Huang S, Cai N, Pacheco PP, Narrandes S, Wang Y, Xu W.",
  "link": "https://pubmed.ncbi.nlm.nih.gov/29275361/"
}
```
## 📊: RPubs
Berikut merupakan link Rpubs visualisasi data: https://rpubs.com/Yunia_Hasnataeni/Tugas_Scraping


## 📂: PPT
Berikut adalah link PPT: https://www.canva.com/design/DAGHqFZug3o/_bb4XZcqD6r-LAidnMl4Bw/view?utm_content=DAGHqFZug3o&utm_campaign=designshare&utm_medium=link&utm_source=editor 

## 👤: Pengembang
[Yunia Hasnataeni](https://github.com/YuniaHasnataeni) - G1501231074
