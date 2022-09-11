import 'dart:convert';

class Noticias {
  Noticias({
    required this.titulo,
    required this.contenido,
    required this.foto,
    required this.url,
    required this.categoria,
    required this.dirigido,
  });

  String titulo;
  String contenido;
  String foto;
  String url;
  String categoria;
  String dirigido;

  factory Noticias.fromJson(String str) => Noticias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Noticias.fromMap(Map<String, dynamic> json) => Noticias(
        titulo: json["titulo"],
        contenido: json["contenido"],
        foto: json["foto"],
        url: json["url"],
        categoria: json["categoria"],
        dirigido: json["dirigido"],
      );

  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "contenido": contenido,
        "foto": foto,
        "url": url,
        "categoria": categoria,
        "dirigido": dirigido,
      };
}
