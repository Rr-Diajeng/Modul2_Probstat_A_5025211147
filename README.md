# Modul2_Probstat_5025211147
Praktikum Probstat 2

## Identitas
| Name                                | NRP         | Kelas      |
| ---                                 | ---         | -----------|
| Rr. Diajeng Alfisyahrinnisa Anandha | 5025211147  | Probstat A |

## Soal 1

### Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 .

<p align = "center">
<img width="194" alt="image" src="https://user-images.githubusercontent.com/91377782/207201236-cc07b94f-c203-4b6c-a213-cb361213a9a0.png">
</P>

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

> Kita masukkan declare dulu isi tabel dengan variabel x dan variabel y

``` Volt
#data x
x <- c(78,75,67,77,70,72,78,74,77)

#data y
y <- c(100,95,70,90,90,90,89,90,100)
```

> Lalu kita lakukan perhitungan standar deviasi
``` Volt
standarDeviasi_Before <- sd(x)
standarDeviasi_After <- sd(y)
```

> Sehingga Standar Deviasi dari data selisih pasangan pengamatan tabel diatas adalah 
<img width="547" alt="image" src="https://user-images.githubusercontent.com/91377782/207202203-8287977a-a7d0-4a21-8fc6-10590287023e.png">


### b. Carilah nilai t (p-value)
> Untuk mencari nilai t, kita dapat gunakan fungsi `t.test()`

``` Volt
t.test(x, y, paired = TRUE)
```
<img width="332" alt="image" src="https://user-images.githubusercontent.com/91377782/207202474-25c98fba-3b88-4eaa-bcc5-c8a1ab298523.png">

> Sehingga hasil yang didapatkan adalah

<img width="556" alt="image" src="https://user-images.githubusercontent.com/91377782/207202522-7dcdc47b-4307-4d3c-9108-5fbad1bbb033.png">

### c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

> Kita gunakan fungsi `var.test()` dan `t.test()`
``` Volt
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)
```

<img width="547" alt="image" src="https://user-images.githubusercontent.com/91377782/207202739-d099cf76-51a5-465d-894a-91b729420cd1.png">

> Lalu kita dapatkan hasil dari `var.test()` yaitu
<img width="546" alt="image" src="https://user-images.githubusercontent.com/91377782/207202792-d879477d-3030-492c-b7f5-67f4e94e1f00.png">

> `t.test()` dilakukan untuk mengetahui apakah ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A. 
> Hasil dari `t.test()` yang kita dapatkan yaitu
<img width="571" alt="image" src="https://user-images.githubusercontent.com/91377782/207202857-26de6d48-9ef8-477e-a32f-37b8826ca645.png">

## Soal 2 (Hipotesa 1 Sampel)
### Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul). 

### a. Apakah Anda setuju dengan klaim tersebut?
> Setuju, karena uji z menolak H0, maka mobil yang dikemudikan rata-rata lebih dari 20.000 kilometer per tahun

### b. Jelaskan maksud dari output yang dihasilkan! 
> Pertama-tama kita install dulu package BSDA dan declare `library(BSDA)`
``` Volt
install.packages("BSDA")
library (BSDA)
```

> Lalu, kita hitung menggunakan `tsum.test()`
``` Volt

# diketahui
rata2 <- 23500
standar_deviasi <- 3900
pemilik_mobil <- 100

#hasil
tsum.test(mean.x= rata2, sd(standar_deviasi),
          n.x = pemilik_mobil, var.equal = FALSE)
```

<img width="437" alt="image" src="https://user-images.githubusercontent.com/91377782/207205451-a4e7e4af-9666-47f9-bcf2-1eaee3aabe5f.png">

### c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
> Kita buat variabel `data.mean`, `data.a`, `data.sd`, `data.n` lalu kita hitung `z` 
``` Volt
data.mean <- 23500
data.a <- 20000
data.sd <- 3900
data.n <- 100

z <- (data.mean - data.a) / (data.sd/ sqrt(data.n))
2 * pnorm(-abs(z))
```
<img width="510" alt="image" src="https://user-images.githubusercontent.com/91377782/207205729-603a27d4-a386-4a13-8ae3-48cc06da69cd.png">

## Soal 3 (Hipotesa 2 sampel)
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

<img width="385" alt="image" src="https://user-images.githubusercontent.com/91377782/207205811-32c04c76-a263-4429-bbba-56b92bcddd17.png">

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

### a. H0 dan H1(3)

> H0 dilakukan perhitungan sebagai berikut:
<img width="166" alt="image" src="https://user-images.githubusercontent.com/91377782/207207048-a03897dc-2e04-4f9e-8383-761ff4912c8e.png">

> H1 dilakukan perhitungan sebagai berikut
<img width="174" alt="image" src="https://user-images.githubusercontent.com/91377782/207207107-090b2b63-3187-4999-b9ff-8f7a4e2f6a98.png">

### b. Hitung Sampel Statistik(3)
> Dilakukan perhitungan sampel dengan menggunakan fungsi `tsum.test()`

``` Volt
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)
```

<img width="545" alt="image" src="https://user-images.githubusercontent.com/91377782/207207298-da439a03-accd-4ef2-9a2e-09475026956c.png">

### c. Lakukan Uji Statistik (df =2)(5)
> Pertama, kita install dulu packages "mosaic" lalu gunakan `library(mosaic)`

``` Volt
install.packages("mosaic")
library(mosaic)
```

> Lalu, kita lakukan plot menggunakan fungsi `plotDist()`
``` Volt
plotDist(dist = 't', df = 2, col = 'Orange')
```

> Sehingga hasilnya adalah

<img width="394" alt="image" src="https://user-images.githubusercontent.com/91377782/207207625-02f11943-5b61-495a-bdda-bec9ef5d4ce1.png">

### d. Nilai Kritikal(3)
> Untuk mendapatkan nilai kritikal dapat menggunakan `qchisq` dengan `df = 2`
``` Volt
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

<img width="446" alt="image" src="https://user-images.githubusercontent.com/91377782/207207779-9a10b3f5-896b-40f2-b4ed-f427eb142bd3.png">

### e. Keputusan(3)
> Teori keputusan adalah teori untuk pengambilan keputusan dibawah ketidakpastian. Aksinya adalah `({a}_{a∈A})`. Kemungkinan konsekuensinya adalah `({c}_{c∈C})` yang tergantung pada keadaan dan tindakan. Maka keputusan dapat dibuat dengan `t.test`

### f. Kesimpulan(3)

> Kesimpulan yang didapatkan yaitu perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik dan akan ada tetapi tidak signifikan jika dipengaruhi nilai kritikal

## Soal 4 (Anova 1 arah)
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. 
Jika : 
diketahui dataset  https://intip.in/datasetprobstat1 
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama    
Maka Kerjakan atau Carilah:

### a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

> Pertama-tama kita up file anova ke aplikasi rstudio
``` Volt
oneWayAnova = read.table(file = "D:\\Download\\onewayanova.txt", header = TRUE) 
attach(oneWayAnova)
names(oneWayAnova)
```
> Karena setiap grupnya berdistribusi normal maka tidak ada outlier utama. Untuk itu kita gunakan factor untuk membuat grup tiap jenisnya dan memberikan label dan subset pada setiap grup. Group 1 adalah kucing oren, Group 2 adalah kucing hitam, dan Group 3 adalah kucing putih 

``` Volt
oneWayAnova$Group <- as.factor(oneWayAnova$Group)
oneWayAnova$Group = factor(oneWayAnova$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(oneWayAnova$Group)

#membagi 3 group
Group1 <- subset(oneWayAnova, Group == "Kucing Oren")
Group2 <- subset(oneWayAnova, Group == "Kucing Hitam")
Group3 <- subset(oneWayAnova, Group == "Kucing Putih")
```

> Lalu kita gambar plot kuantil normal untuk setiap grup sehingga dapat dilihat distribusi data dan outlier utama dalam homogenitas varians pada masing-masing grup

``` Volt
qqnorm(Group1$Length)
qqline(Group1$Length)
```

<img width="426" alt="image" src="https://user-images.githubusercontent.com/91377782/207210151-e92434ae-128a-449e-ad14-619069ca1589.png">

``` Volt
qqnorm(Group2$Length)
qqline(Group2$Length)
```

<img width="396" alt="image" src="https://user-images.githubusercontent.com/91377782/207210230-d4d0e3b3-98dd-4724-9afb-1363e1468829.png">

``` Volt
qqnorm(Group3$Length)
qqline(Group3$Length)
```

<img width="426" alt="image" src="https://user-images.githubusercontent.com/91377782/207210348-0d9bdf19-01c9-4110-846d-8ed420b24708.png">


### b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

> Untuk mendapatkan himogeneity of variances, dapat digunakan sebuah fungsi yaitu `bartlett.test()` 

``` Volt
#4b
bartlett.test(Length~Group, data = oneWayAnova)
```

<img width="424" alt="image" src="https://user-images.githubusercontent.com/91377782/207210553-35b42b8d-23d1-4249-b1a1-f7ba90a55ab0.png">

### c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

> Kita buat variabel model1 berisi fungsi `lm()` lalu masukkan variabel model1 kedalam `anova()`

``` Volt
model1 = lm(Length~Group, data = oneWayAnova)
anova(model1)
```

<img width="403" alt="image" src="https://user-images.githubusercontent.com/91377782/207218610-9e17ff58-1e26-4b66-ac68-98c3f69a62a5.png">

### d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?
> Dari poin c, didapakan nilai `F-Value = 7.0982` yang berarti `p-value < 0.05`
> Kesimpulan yang didapatkan yaitu kita menolak hipotesis null / H0, sehingga terdapat perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

### e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

> Kita lakukan `post-hoc test TurkeyHSD` untuk mengetahui perbandingan tiap-tiap spesies

``` Volt
TukeyHSD(aov(model1))
```
<img width="442" alt="image" src="https://user-images.githubusercontent.com/91377782/207219119-928c700a-d4cc-4eab-8b01-ffc828368892.png">

> Dari hasil tersebut, dapat diketahui p-value dari tiap 2 jenis grup. Jika `p-value < 0.05` maka panjang kedua grup berbeda. Jika `p-value >= 0.05` maka panjangnya sama. Berdasarkan hasil tersebut, dapat disimpulkan bahwa kucing putih dan kucing oren memiliki ukuran dan panjang yang sama.

### f. Visualisasikan data dengan ggplot2

> Untuk bisa menggunakan fungsi `ggplot()`, kita terlebih dahulu install packages dan menggunakan librarynya

``` Volt
install.packages("ggplot2")
library("ggplot2")
```

> Setelah itu, kita dapat gunakan fungsi `ggplot()`

``` Volt
ggplot(oneWayAnova, aes(x = Group, y = Length)) +
  geom_boxplot(color = c("#00AFBB", "#E7B800", "#FC4E07")) +
  scale_x_discrete() + xlab("Group") + ylab("Length (cm)")
```

<img width="460" alt="image" src="https://user-images.githubusercontent.com/91377782/207219652-f47330cf-6095-4a65-b39c-0eac53e0c76a.png">

## Soal 5 (Anova 2 arah)
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 

> Pertama-tama download `.csv` lalu read isi `.csv`

``` Volt
GTL <- read.csv(file = "D:\\Download\\GTL.csv")
head(GTL)
str(GTL)
```

### a. Buatlah plot sederhana untuk visualisasi data 
> Visualisasi dilakukan dengan menggunakan fungsi `qplot()`

``` Volt
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```

<img width="385" alt="image" src="https://user-images.githubusercontent.com/91377782/207296125-565d4a27-fd7e-4358-b7f3-c965c3f3db8d.png">


### b. Lakukan uji ANOVA dua arah untuk 2 faktor
> Membuat variabel as factor sebagai ANOVA

``` Volt
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```

<img width="295" alt="image" src="https://user-images.githubusercontent.com/91377782/207296333-316f5866-6a08-487b-81b6-61cc9a4a4364.png">

> Melakukan ANOVA dengan fungsi `summary(aov())` 

``` Volt
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

<img width="238" alt="image" src="https://user-images.githubusercontent.com/91377782/207296489-396af299-2aaa-44eb-9014-76b082a384fd.png">


### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

> Digunakan fungsi `group_by()` yang digunakan untuk melakukan data summary dengan fungsi `summarise()` 

``` Volt
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
<img width="297" alt="image" src="https://user-images.githubusercontent.com/91377782/207296892-6af77837-55c1-4b81-a708-18e05ca05f1a.png">



### d. Lakukan uji Tukey
> Digunakan fungsi `TukeyHSD()` untuk uji Tukey

``` Volt
tukey <- TukeyHSD(anova)
print(tukey)
```
<img width="501" alt="image" src="https://user-images.githubusercontent.com/91377782/207298909-9dcbd12d-13cc-4b00-8f25-db19adb0afe7.png">
<img width="478" alt="image" src="https://user-images.githubusercontent.com/91377782/207299073-28b2df41-3f57-44ab-8fb3-a3aea0cdcafb.png">
<img width="474" alt="image" src="https://user-images.githubusercontent.com/91377782/207299159-5229eb24-66e1-48ca-8976-836d792e4e7c.png">



### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

> Membuat compact letter display dengan fungsi `multcompLetterS4()`

``` Volt
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
<img width="438" alt="image" src="https://user-images.githubusercontent.com/91377782/207299796-8c96363c-bd8b-401e-a99f-686381556c2f.png">

> Menambahkan compact letter display ke tabel dengan mean dan standar deviasi yagn telah dibuat 

``` Volt
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
<img width="250" alt="image" src="https://user-images.githubusercontent.com/91377782/207300051-eca09997-cb0e-416a-8b57-e0f047906b41.png">








