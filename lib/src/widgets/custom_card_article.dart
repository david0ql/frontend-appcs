import 'package:appcs/src/theme/app_theme.dart';
import 'package:appcs/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';

import '../models/people_response.dart';
import '../providers/people_service.dart';

class CustomCardArticle extends StatelessWidget {
  const CustomCardArticle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticiaProv = Provider.of<PeopleService>(context);
    late final List<Noticias> noticia;
    noticia = UserPreferences.tipoRol == 1
        ? noticiaProv.noticiasEstudiantes
        : noticiaProv.noticiasDocentes;

    return ListView.builder(
      itemCount: noticia.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            await FlutterWebBrowser.openWebPage(
                url: noticia[index].url,
                customTabsOptions: const CustomTabsOptions(
                  colorScheme: CustomTabsColorScheme.light,
                  shareState: CustomTabsShareState.on,
                  instantAppsEnabled: true,
                  showTitle: true,
                  urlBarHidingEnabled: true,
                ));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(noticia[index].foto),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.turned_in_not,
                        color: AppTheme.primaryColor),
                    Flexible(child: Text(noticia[index].titulo.toUpperCase())),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.person_pin_circle,
                        color: AppTheme.primaryColor),
                    Text(noticia[index].categoria.toUpperCase()),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(noticia[index].contenido),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
