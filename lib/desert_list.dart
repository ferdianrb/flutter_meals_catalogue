import 'package:meals_catalogue/main.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/detail_screen.dart';

class Desert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: desert.length,
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
                  builder: (context) => DetailScreen(item: desert[index]),
                ),
              );
              final snackBar = SnackBar(
                duration: Duration(seconds: 2),
                content: Text(desert[index].name),
                action: SnackBarAction(
                  textColor: Colors.blue,
                  label: 'Close',
                  onPressed: () {},
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: new Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 14.0,
                  child: Hero(
                    tag: desert[index].pic,
                    child: Image.asset(
                      desert[index].pic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Expanded(
                  child: Center(
                    child: Text(
                      desert[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Food> desert = <Food>[
  Food(
      name: 'Sate Madura',
      pic: 'assets/sate_madura.jpg',
      desc:
          'Sate Madura (Madura: Satè Mâdhurâ) adalah sate yang meiliki bumbu khas Madura. Sate Madura biasanya terbuat dari ayam. Madura selain terkenal sebagai pulau garam, juga terkenal dengan satenya. Sate madura sudah terkenal di seluruh Nusantara, Sate Madura dapat ditemukan hampir di semua daerah khususnya di kota besar seperti Medan, Jakarta, Bandung, dan Surabaya. Konon di Madura sendiri sate susah dicari.'),
  Food(
      name: 'Sate Padang',
      pic: 'assets/sate_padang.jpg',
      desc:
          'Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.Sate Padang Panjang dibedakan dengan kuah sate nya yang berwarna kuning sedangkan sate Pariaman kuahnya berwarna merah. Rasa kedua jenis sate ini juga berbeda. Sedangkan sate Padang mempunyai bermacam rasa perpaduan kedua jenis varian sate di atas.'),
  Food(
      name: 'Sate Taichan',
      pic: 'assets/sate_taichan.jpg',
      desc:
          'Sate taichan adalah sebuah varian sate yang berisi daging ayam yang dibakar tanpa baluran bumbu kacang atau kecap seperti sate pada umumnya. Sate ini hanya disajikan dengan sambal dan perasan jeruk nipis, sementara daging sate untuk sate taichan lazimnya berwarna putih polos dan hanya dibumbui garam, jeruk nipis, dan sedikit cabai. Sate ini dijual pada malam hari, lazimnya sate-sate pada umumnya.'),
  Food(
      name: 'Soto Mie',
      pic: 'assets/soto_mie.jpg',
      desc:
          'Soto Mie adalah hidangan mi berkuah kaldu berbumbu yang lazim ditemukan di Indonesia lebih tepatnya di Sunda, Bogor, Jawa Barat. Masakan Khas Sunda ini kini tidak hanya terdapat di Indonesia, Namun hidangan ini kini juga dikenal di Malaysia dan Singapura. Mie berarti mi telur dari tepung terigu, garam, dan telur, sementara made soto merujuk kepada hidangan sup berkuah khas Indonesia. Di Indonesia soto mie dianggap salah satu jenis hidangan soto atau mi berkuah, sementara di Malaysia dan Singapura hidangan ini disebut mee soto.'),
  Food(
      name: 'Soto Tangkar',
      pic: 'assets/soto_tangkar.jpg',
      desc:
          'Soto Tangkar adalah makanan Betawi. Nama tangkar sendiri adalah sebutan untuk iga sapi dalam bahasa Betawi pada zaman penjajahan Belanda dan sampai sekarang masih dipergunakan, meskipun sudah jarang diketahui oleh generasi saat ini.'),
  Food(
      name: 'Ikan Bakar',
      pic: 'assets/ikan_bakar.jpg',
      desc:
          'Ikan bakar adalah hidangan ikan yang dibakar atau dipanggang di atas api atau bara api. Hidangan ikan yang dibakar, muncul secara universal di berbagai belahan dunia.[1] Akan tetapi secara khusus di dunia internasional, istilah "ikan bakar" merujuk kepada ikan bakar khas Indonesia dan Malaysia berupa ikan atau boga bahari lain yang dipanggang di atas arang atau bara api. Ikan bakar adalah salah satu hidangan klasik Indonesia.'),
  Food(
      name: 'Ayam Bakar',
      pic: 'assets/ayam_bakar.jpg',
      desc:
          'Ayam bakar adalah sebuah hidangan Asia Tenggara Maritim, terutama hidangan Indonesia atau Malaysia, dari ayam yang dipanggang di atas arang.'),
];
