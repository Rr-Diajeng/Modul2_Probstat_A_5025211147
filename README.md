# Modul2_Probstat_5025211147
Praktikum Probstat 2

## Identitas
| Name                                | NRP         | Kelas      |
| ---                                 | ---         | -----------|
| Rr. Diajeng Alfisyahrinnisa Anandha | 5025211147  | Probstat A |

## Soal 1

### Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 .

<p align = "center">
 <img width="195" alt="image" src="https://user-images.githubusercontent.com/91377782/207200603- d81fde11-8d5a-4e22-9303-9648a2948fca.png">
</p>
Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

> Kita masukkan declare dulu isi tabel dengan variabel x dan variabel y

``` Volt
#data x
x <- c(78,75,67,77,70,72,78,74,77)

#data y
y <- c(100,95,70,90,90,90,89,90,100)
```

> Lalu kita lakukan pengecekan data
``` Volt
sd(x - y)
```

> Sehingga Standar Deviasi dari data selisih pasangan pengamatan tabel diatas adalah `6.359595`

<img width="180" alt="image" src="https://user-images.githubusercontent.com/91377782/207201144-5c31dcfd-93af-42b5-a42d-9787e4a218ec.png">

