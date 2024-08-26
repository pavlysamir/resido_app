import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  static HomeCubit? get(context) => BlocProvider.of(context);

  final HomeRepo homeRepository;

  List<BannerModel> bannerList = [];

  getBanner() async {
    emit(GetBannerLoading());
    final response = await homeRepository.getBannerData();

    response.fold(
      (errMessage) => emit(GetBannerFailure(message: errMessage)),
      (banners) {
        bannerList = banners.data;
        emit(GetBannerSuccess());
      },
    );
  }
}
