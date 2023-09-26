# Assignment-3-PKB

# Nama Kelompok
    1. Narendra Arkan Putra Darmawan
    2. Muhammad Ramadhan Putra Pratama

# Cara Kerja
    1. Import Library:
        Kode pertama digunakan untuk mengimpor pustaka yang akan digunakan dalam program, yaitu CSV untuk membaca data dari file CSV, DataFrames untuk mengelola data dalam bentuk data frame, dan Plots untuk membuat plot grafik.

    2. Membaca Data Iris:
        Program membaca dataset Iris dari file CSV yang disebut "iris.csv" menggunakan CSV.File dan kemudian mengonversinya menjadi data frame menggunakan DataFrame. Hasilnya disimpan dalam variabel iris_data.

    3. Memilih Kolom untuk Plotting:
        Program menampilkan pesan kepada pengguna untuk memilih dua kolom dari dataset Iris yang ingin diplot. Pengguna diminta untuk memasukkan angka yang sesuai dengan pilihan kolom yang tersedia.

    4. Membaca Input Pengguna:
        Program membaca input pengguna menggunakan readline() dan memisahkan input tersebut menjadi dua angka yang dipilih menggunakan split(). Kemudian, program memeriksa apakah tepat dua kolom yang dipilih. Jika tidak, program mencetak pesan kesalahan dan keluar.

    5. Mengonversi Nomor Kolom ke Nama Kolom:
        Program mengonversi nomor kolom yang dipilih oleh pengguna menjadi nama kolom sesuai dengan urutan yang telah ditentukan.

    6. Memisahkan Data Menjadi Dua Kelas:
        Data dari dataset Iris dibagi menjadi dua kelas: "Iris-setosa" dan "Iris-versicolor" menggunakan operasi indexing. Data yang sesuai dengan kelas ini disimpan dalam variabel setosa dan versicolor.

    7. Menghitung Garis Batas:
        Program mendefinisikan sebuah fungsi calculate_boundary yang digunakan untuk menghitung persamaan garis batas antara dua kelas. Ini dilakukan dengan melakukan regresi linier pada data dari dua kelas yang diberikan.

    8. Menghitung Garis Batas Antara Kelas Setosa dan Versicolor:
        Program menghitung garis batas antara kelas "Iris-setosa" dan "Iris-versicolor" menggunakan fungsi calculate_boundary. Hasilnya disimpan dalam variabel boundary_setosa dan boundary_versicolor.

    9. Menentukan Bentuk Data Point:
        Program menentukan bentuk (shape) yang berbeda untuk dua kelas data, yaitu setosa_shape dan versicolor_shape.

    10. Menentukan Nilai x untuk Plot Garis Batas:
        Program menentukan nilai-nilai x yang akan digunakan untuk plot garis batas. Nilai-nilai ini mencakup rentang data dengan tambahan lebar 0.5.

    11. Membuat Plot Data:
        Program membuat plot data dengan menggunakan pustaka Plots. Ini mencakup plotting titik-titik data untuk kedua kelas ("Iris-setosa" dan "Iris-versicolor") dengan menggunakan bentuk yang telah ditentukan.

    12. Membuat Plot Garis Batas:
        Program membuat plot garis batas antara kedua kelas menggunakan persamaan garis batas yang telah dihitung sebelumnya. Garis ini ditambahkan ke plot sebagai garis merah.

    13. Menyimpan Plot sebagai Gambar PNG:
        Program menyimpan plot sebagai gambar PNG dengan nama "iris_boundary.png" menggunakan savefig().

    14. Pesan Sukses:
        Program mencetak pesan sukses setelah berhasil menyimpan plot.
