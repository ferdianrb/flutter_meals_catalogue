import 'package:flutter/material.dart';
import 'package:meals_catalogue/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class Food {
  final String name;
  final String pic;
  final String desc;

  Food({this.name, this.pic, this.desc});
}

List<Food> foods = <Food>[
  Food(name: 'Fried Chicken', pic: 'assets/chicken.jpg',
      desc: 'Ayam goreng adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. Beberapa rumah makan siap saji secara khusus menghidangkan ayam goreng, misalnya Kentucky Fried Chicken. Sementara itu beberapa rumah makan di Indonesia juga menghidangkan ayam goreng tradisional Indonesia seperti Ayam Goreng Suharti, Fatmawati dan Mbok Berek.'),
  Food(name: 'Mie Goreng', pic: 'assets/mie_goreng.jpg',
      desc: 'Mi goreng berarti "mi yang digoreng" adalah makanan yang populer dan digemari di Indonesia, Malaysia, dan Singapura. Mi goreng terbuat dari mi kuning yang digoreng dengan sedikit minyak goreng, dan ditambahkan bawang putih, bawang merah, udang serta daging ayam atau daging sapi, irisan bakso, cabai, sayuran, tomat, telur ayam, dan acar.'),
  Food(name: 'Nasi Goreng', pic: 'assets/nasi_goreng.jpg',
      desc: 'Nasi goreng adalah sebuah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng atau margarin, biasanya ditambah kecap manis, bawang merah, bawang putih, asam jawa, lada dan bumbu-bumbu lainnya, seperti telur, ayam, dan kerupuk. Ada pula nasi goreng jenis lain yang dibuat bersama ikan asin yang juga populer di seluruh Indonesia.'),
  Food(name: 'Nasi Uduk', pic: 'assets/nasi_uduk.jpg',
      desc: 'Nasi uduk adalah nama sejenis makanan terbuat dari bahan dasar nasi putih yang diaron dan dikukus dengan santan dari kelapa yang di parut, serta dibumbui dengan pala, kayu manis, jahe, daun serai dan merica. Makanan ini kemudian dihidangkan dengan emping goreng, tahu goreng, telur dadar/telur goreng yang sudah diiris-iris, abon, kering tempe, bawang goreng, ayam goreng, timun dan sambal dari kacang.'),
  Food(name: 'Rendang', pic: 'assets/rendang.jpg',
      desc: 'Rendang atau randang (Jawi: رندڠ) adalah masakan daging bercita rasa pedas yang menggunakan campuran dari berbagai bumbu dan rempah-rempah. Masakan ini dihasilkan dari proses memasak yang dipanaskan berulang-ulang dengan santan kelapa. Proses memasaknya memakan waktu berjam-jam (biasanya sekitar empat jam) hingga kering dan berwarna hitam pekat. Dalam suhu ruangan, rendang dapat bertahan hingga berminggu-minggu. Rendang yang dimasak dalam waktu yang lebih singkat dan santannya belum mengering disebut kalio, berwarna coklat terang keemasan.'),
  Food(name: 'Soto Ayam', pic: 'assets/soto_ayam.jpg',
      desc: 'Soto ayam adalah makanan khas Indonesia yang berupa sejenis sup ayam dengan kuah yang berwarna kekuningan. Warna kuning ini dikarenakan oleh kunyit yang digunakan sebagai bumbu. Soto ayam banyak ditemukan di daerah-daerah di Indonesia dan Singapura. Selain ayam bahan yang digunakan juga meliputi telur rebus, irisan kentang, daun seledri, serta bawang goreng. Terkadang soto juga disajikan dengan lontong atau nasi putih.'),
  Food(name: 'Pecel Ayam', pic: 'assets/pecel_ayam.jpg',
      desc: 'Pecel ayam dapat dengan mudah ditemukan di tenda-tenda pinggir jalan. Meski dijual di pinggir jalan, kuliner yang berasal dari Jawa ini memiliki rasa yang nikmat. Biasanya, akan disajikan juga lalapan berupa mentimun, kemangi, kol, serta sambal sebagai pelengkapnya. Makanan murah meriah ini sangat cocok menjadi pendamping nasi hangat.'),
  Food(name: 'Pecel Lele', pic: 'assets/pecel_lele.jpg',
      desc: 'Pecak lele (atau lebih dikenal pecel lele) di Indonesia adalah nama sebuah makanan khas Jawa Tengah yang terdiri dari ikan lele dan sambal (bumbu) pecak. Biasanya yang dimaksud adalah ikan lele yang digoreng kering dengan minyak lalu disajikan dengan sambal tomat dan lalapan. Lalapan biasa terdiri dari kemangi, kubis, mentimun, dan kacang panjang.'),
  Food(name: 'Sate Madura', pic: 'assets/sate_madura.jpg',
      desc: 'Sate Madura (Madura: Satè Mâdhurâ) adalah sate yang meiliki bumbu khas Madura. Sate Madura biasanya terbuat dari ayam. Madura selain terkenal sebagai pulau garam, juga terkenal dengan satenya. Sate madura sudah terkenal di seluruh Nusantara, Sate Madura dapat ditemukan hampir di semua daerah khususnya di kota besar seperti Medan, Jakarta, Bandung, dan Surabaya. Konon di Madura sendiri sate susah dicari.'),
  Food(name: 'Sate Padang', pic: 'assets/sate_padang.jpg',
      desc: 'Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.Sate Padang Panjang dibedakan dengan kuah sate nya yang berwarna kuning sedangkan sate Pariaman kuahnya berwarna merah. Rasa kedua jenis sate ini juga berbeda. Sedangkan sate Padang mempunyai bermacam rasa perpaduan kedua jenis varian sate di atas.'),
  Food(name: 'Sate Taichan', pic: 'assets/sate_taichan.jpg',
      desc: 'Sate taichan adalah sebuah varian sate yang berisi daging ayam yang dibakar tanpa baluran bumbu kacang atau kecap seperti sate pada umumnya. Sate ini hanya disajikan dengan sambal dan perasan jeruk nipis, sementara daging sate untuk sate taichan lazimnya berwarna putih polos dan hanya dibumbui garam, jeruk nipis, dan sedikit cabai. Sate ini dijual pada malam hari, lazimnya sate-sate pada umumnya.'),
  Food(name: 'Soto Mie', pic: 'assets/soto_mie.jpg',
      desc: 'Soto Mie adalah hidangan mi berkuah kaldu berbumbu yang lazim ditemukan di Indonesia lebih tepatnya di Sunda, Bogor, Jawa Barat. Masakan Khas Sunda ini kini tidak hanya terdapat di Indonesia, Namun hidangan ini kini juga dikenal di Malaysia dan Singapura. Mie berarti mi telur dari tepung terigu, garam, dan telur, sementara made soto merujuk kepada hidangan sup berkuah khas Indonesia. Di Indonesia soto mie dianggap salah satu jenis hidangan soto atau mi berkuah, sementara di Malaysia dan Singapura hidangan ini disebut mee soto.'),
  Food(name: 'Soto Tangkar', pic: 'assets/soto_tangkar.jpg',
      desc: 'Soto Tangkar adalah makanan Betawi. Nama tangkar sendiri adalah sebutan untuk iga sapi dalam bahasa Betawi pada zaman penjajahan Belanda dan sampai sekarang masih dipergunakan, meskipun sudah jarang diketahui oleh generasi saat ini.'),
  Food(name: 'Ikan Bakar', pic: 'assets/ikan_bakar.jpg',
      desc: 'Ikan bakar adalah hidangan ikan yang dibakar atau dipanggang di atas api atau bara api. Hidangan ikan yang dibakar, muncul secara universal di berbagai belahan dunia.[1] Akan tetapi secara khusus di dunia internasional, istilah "ikan bakar" merujuk kepada ikan bakar khas Indonesia dan Malaysia berupa ikan atau boga bahari lain yang dipanggang di atas arang atau bara api. Ikan bakar adalah salah satu hidangan klasik Indonesia.'),
  Food(name: 'Ayam Bakar', pic: 'assets/ayam_bakar.jpg',
      desc: 'Ayam bakar adalah sebuah hidangan Asia Tenggara Maritim, terutama hidangan Indonesia atau Malaysia, dari ayam yang dipanggang di atas arang.'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Meals Catalogue';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xFF761322),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.grey,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(item: foods[index]),
                      ),
                    );
                  },
                  child: new Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 18.0 / 14.0,
                        child: Image.asset(
                          foods[index].pic,
                          fit: BoxFit.cover,
                        ),
                      ),
                      new Expanded(
                        child: Center(
                          child: Text(
                            foods[index].name,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}