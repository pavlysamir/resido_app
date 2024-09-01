// lib/features/favourite/ui/views/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/favourite/logic/cubit/favorite_cubit.dart';

import '../../../profile/profile_edite/presentation/components/profile_edit_screen_components.dart';
import '../widgets/favorites_item_widget.dart';
import '../../data/models/DataFavoriteModel.dart';

class FavoritesScreen extends StatelessWidget {

   FavoritesScreen({super.key,});
   final dataFavoriteModel = DataFavoriteModel.fromJson({
     "data": [
       {
         "id": 5,
         "user_id": 25,
         "apartment_id": 1,
         "created_at": "2024-09-01T08:42:17.000000Z",
         "updated_at": "2024-09-01T08:42:17.000000Z",
         "apartment": {
           "id": 1,
           "image": "https://ai.w-manage.org/public/images/apartments/1724844043.jfif",
           "price": "100000",
           "bedrooms": "12",
           "bathrooms": "2",
           "area": "1000",
           "featured": "1",
           "delivery_in": null,
           "longitude": "12",
           "latitude": "31",
           "balconies": "2",
           "likes": "4",
           "grage": "3",
           "status_id": 1,
           "type_id": 1,
           "compound_id": 1,
           "user_id": 1,
           "sub_id": 1,
           "created_at": "2024-08-28T08:20:43.000000Z",
           "updated_at": "2024-08-28T12:52:10.000000Z",
           "title": "villa",
           "description": "desc",
           "address": "Address",
           "translations": [
             {
               "id": 2,
               "apartment_id": 1,
               "locale": "ar",
               "title": "شقة",
               "address": "العنوان",
               "description": "وصف"
             },
             {
               "id": 1,
               "apartment_id": 1,
               "locale": "en",
               "title": "villa",
               "address": "Address",
               "description": "desc"
             }
           ]
         }
       },
       {
         "id": 6,
         "user_id": 26,
         "apartment_id": 2,
         "created_at": "2024-09-02T08:42:17.000000Z",
         "updated_at": "2024-09-02T08:42:17.000000Z",
         "apartment": {
           "id": 2,
           "image": "https://th.bing.com/th/id/OIP.SQBYmy_hZew7AFHVDHr3BgAAAA?rs=1&pid=ImgDetMain",
           "price": "200000",
           "bedrooms": "10",
           "bathrooms": "3",
           "area": "1200",
           "featured": "0",
           "delivery_in": null,
           "longitude": "13",
           "latitude": "32",
           "balconies": "3",
           "likes": "5",
           "grage": "2",
           "status_id": 2,
           "type_id": 2,
           "compound_id": 2,
           "user_id": 2,
           "sub_id": 2,
           "created_at": "2024-08-29T08:20:43.000000Z",
           "updated_at": "2024-08-29T12:52:10.000000Z",
           "title": "apartment",
           "description": "description",
           "address": "Address 2",
           "translations": [
             {
               "id": 3,
               "apartment_id": 2,
               "locale": "ar",
               "title": "شقة 2",
               "address": "العنوان 2",
               "description": "وصف 2"
             },
             {
               "id": 4,
               "apartment_id": 2,
               "locale": "en",
               "title": "apartment",
               "address": "Address 2",
               "description": "description"
             }
           ]
         }
       },
       {
         "id": 7,
         "user_id": 27,
         "apartment_id": 3,
         "created_at": "2024-09-03T08:42:17.000000Z",
         "updated_at": "2024-09-03T08:42:17.000000Z",
         "apartment": {
           "id": 3,
           "image": "https://th.bing.com/th/id/OIP.rlrfd4t-Mo9vRrdCOI9G6gHaEK?rs=1&pid=ImgDetMain",
           "price": "300000",
           "bedrooms": "8",
           "bathrooms": "4",
           "area": "1400",
           "featured": "1",
           "delivery_in": null,
           "longitude": "14",
           "latitude": "33",
           "balconies": "4",
           "likes": "6",
           "grage": "1",
           "status_id": 3,
           "type_id": 3,
           "compound_id": 3,
           "user_id": 3,
           "sub_id": 3,
           "created_at": "2024-08-30T08:20:43.000000Z",
           "updated_at": "2024-08-30T12:52:10.000000Z",
           "title": "house",
           "description": "description 3",
           "address": "Address 3",
           "translations": [
             {
               "id": 5,
               "apartment_id": 3,
               "locale": "ar",
               "title": "شقة 3",
               "address": "العنوان 3",
               "description": "وصف 3"
             },
             {
               "id": 6,
               "apartment_id": 3,
               "locale": "en",
               "title": "house",
               "address": "Address 3",
               "description": "description 3"
             }
           ]
         }
       }
     ]
   });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(

         body: Column(
           children: [
             HeaderWidget(
               title: AppLocalizations.of(context)!.favorites,
               showArrow: false,
             ),
             ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataFavoriteModel.data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FavoriteItem(favoriteData: dataFavoriteModel.data[index]),
                ),
              ),
           ],
         ),
        );
      },
    );
  }
}