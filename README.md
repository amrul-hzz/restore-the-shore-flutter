# Kelompok C03 PBP Gasal Fasilkom UI 2022/2023
Repository ini digunakan untuk Proyek Akhir Semester pada mata kuliah PBP semester gasal Fasilkom UI 2022/2023.

## 👪 Anggota Kelompok
- Amanda Nurul Izzah - 2106634080 [https://github.com/amrul-hzz]
- Fadlan Ariel Fathurrahman - 2106750673 [https://github.com/fadlanariel]
- James Smith Wigglesworth - 2106750225 [https://github.com/jamessmith404]
- Maysha Haliza Kirana - 2106751202 [https://github.com/mayshahaliza]
- Michael Christlambert Sinanta - 2106750414 [https://github.com/michaelsinanta]
- Yeira Putri Nandika - 2106751726 [https://github.com/yeiraputri]

## 📚 Deskripsi aplikasi (nama aplikasi, fungsi aplikasi, dan peran/aktor pengguna aplikasi) 
- Nama aplikasi : Restore The Shore
- Fungsi aplikasi : Aplikasi ini digunakan sebagai sosial media dan wadah interaksi antara pencinta lingkungan dan pengguna yang memiliki keinginan untuk membersihkan pantai. Aplikasi ini berisikan jadwal dan tempat dari event pembersihan sampah beserta forum untuk bertukar pendapat/bersosialisasi. Web ini bertujuan untuk menumbuhkan keinginan masyarakat untuk berkontribusi dalam memelihara lingkungan hidup terutama kebersihan pantai.
- Role atau peran pengguna beserta deskripsinya (karena bisa saja lebih dari satu jenis pengguna yang mengakses aplikasi)
🖊 Role Guest User (Non Logged In)
- Mengakses modul Landing Page.
- Mengakses modul Register dan Login.
- Mengakses modul TimeLine dan jika meng-klik timeline tersebut, user akan di-redirect ke modul Register dan Login.
- Mengakses modul Leaderboard, namun tidak bisa me-post quote.
🖊 Role Logged In User
- Semua modul yang dapat diakses guest user dapat diakses oleh logged-in user.
- Mengakses modul My Account.
- Mengakses modul Forum dan memberikan komentar.
- Dapat mendaftarkan diri ke event di modul TimeLine.
- Dapat me-post quote ke database aplikasi di modul Leaderboard
🖊 Role Admin
- Semua modul yang dapat diakses guest user dan logged-in user - dapat diakses oleh admin.
- Mengakses modul Create Event.
- Memberikan point untuk logged-in user.

## 📝 Daftar fitur atau modul yang diimplementasikan beserta kontrak kinerja per anggota kelompok 
- Landing Page (oleh Maysha Haliza Kirana)
> Modul ini merupakan tampilan pertama yang dilihat oleh user saat membuka aplikasi. User dapat melihat profil dari perusahaan kita, visi dan misi perusahaan, serta event-event pembersihan pantai yang sedang berjalan. Lalu, terdapat button untuk login dan register akun. Pada modul ini, user dapat memberikan saran atau feedback terhadap aplikasi.
- Login + Register (oleh semua)
> Modul ini berisi login yang meminta user untuk memberikan username dan password yang telah didaftarkan sebelumnya pada saat register. Register akan meminta calon user untuk mengisi informasi seperti nama, alamat email, nomor telepon, dan alamat tinggal.
- Timeline (oleh Yeira Putri Nandika)
> Modul ini akan menampilkan event-event apa saja yang akan berlangsung. Event tersebut akan menjelaskan pantai apa yang akan dibersihkan, alamat pantai, tanggal mulai hingga tanggal penutupan acara, serta kapasitas orang yang dibutuhkan untuk membantu pembersihan pantai.
- Create Event (oleh Michael Christlambert Sinanta)
> Modul ini digunakan admin untuk mengunggah event pembersihan pantai dengan mengisi form yang terdiri dari nama pantai, alamat pantai, foto kondisi pantai, penjelasan mengapa pantai pantas untuk dibersihkan, tanggal mulai hingga tanggal penutupan acara, serta kapasitas orang yang dibutuhkan untuk membantu pembersihan pantai. Event yang diunggah akan muncul di Timeline.
- Forum (oleh Amanda Nurul Izzah)
> Modul yang berisi forum pembicaraan dan diskusi antara user. User dapat mengunggah komentar berisi teks maupun foto sehingga membuat sebuah forum baru. User lain dapat membalas forum tersebut serta saling membalas satu sama lain. 
- My Account (oleh Fadlan Ariel Fathurrahman)
> Modul ini akan menampilkan profil user yang berisi thread yang mereka sebelumnya buat, pencapaian-pencapaian saat mereka menyelesaikan event (jika admin memberikan badge), dan event-event yang telah mereka tempuh sebelumnya.
- Leaderboard (oleh James Smith Wigglesworth)
> Modul ini berisi halaman papan peringkat yang akan menampilkan user dengan point tertinggi. Point diberikan oleh admin jika admin merasa bahwa user secara valid menjalani event sesuai dengan aturan yang berlaku. Pada modul ini, user juga dapat memberikan kalimat penyemangat dan ucapan selamat (quote) kepada pemenang di leaderboard.

## 🖥️ Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester
Aplikasi Restore The Shore menggunakan Flutter dalam membuat frontend mobile dengan menggunakan berbagai widget dengan benchmark desain frontend website. Kami juga menggunakan konsep asynchronous HTTP untuk integrasi frontend-backend. Kami menggunakan menggunakan JsonResponse atau JSON Serializer Django untuk pengimplementasi REST API pada backend Django dengan web service atas halaman web sebelumnya yaitu https://restore-the-shore.herokuapp.com/.