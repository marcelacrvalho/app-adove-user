import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/module/home/widgets/card_category_home.dart';
import 'package:adove/app/module/home/widgets/container_yellow_home.dart';
import 'package:adove/app/module/home/widgets/search_city_home.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                const ContainerYellowHomeWidget(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _image(),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: SearchCityHomeWidget(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _categoryList(),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text: 'Os mais populares',
                  fontSize: 12.0,
                  fontColor: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                top: 0.0,
              ),
              child: _topJobs(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return SizedBox(
      width: double.infinity,
      height: Get.mediaQuery.size.height * 0.55,
      child: Image.asset('assets/images/client-bg-home.png'),
    );
  }

  Widget _categoryList() {
    return SizedBox(
      width: double.infinity,
      height: Get.mediaQuery.size.height * 0.25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          CardCategoryHomeWidget(
            category: 'Estética',
            onTap: () => controller.onTapCategoryCard('Estética'),
          ),
          CardCategoryHomeWidget(
            category: 'Salão de Beleza',
            onTap: () => controller.onTapCategoryCard('Salão De Beleza'),
          ),
          CardCategoryHomeWidget(
            category: 'Odontologia',
            onTap: () => controller.onTapCategoryCard('Odontologia'),
          ),
          CardCategoryHomeWidget(
            category: 'Psicologia',
            onTap: () => controller.onTapCategoryCard('Psicologia'),
          ),
          CardCategoryHomeWidget(
            category: 'Depilação',
            onTap: () => controller.onTapCategoryCard('Depilação'),
          ),
          CardCategoryHomeWidget(
            category: 'Manicure e Pedicure',
            onTap: () => controller.onTapCategoryCard('Manicure e Pedicure'),
          ),
          CardCategoryHomeWidget(
            category: 'Maquiagem',
            onTap: () => controller.onTapCategoryCard('Maquiagem'),
          ),
          CardCategoryHomeWidget(
            category: 'Massagem',
            onTap: () => controller.onTapCategoryCard('Massagem'),
          ),
          CardCategoryHomeWidget(
            category: 'Podologia',
            onTap: () => controller.onTapCategoryCard('Podologia'),
          ),
        ],
      ),
    );
  }

  Widget _topJobs() {
    return SizedBox(
      width: double.infinity,
      height: Get.mediaQuery.size.height * 0.25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          CardCategoryHomeWidget(
            category: 'Botox',
            onTap: () {
              JobController.to.inputSearchJob.value = 'Botox';
              JobController.to.toSearchJobView();
            },
          ),
          CardCategoryHomeWidget(
            category: 'Rinomodelação',
            onTap: () {
              JobController.to.inputSearchJob.value = 'Rino';
              JobController.to.toSearchJobView();
            },
          ),
          CardCategoryHomeWidget(
            category: 'Lentes de Contato Dental',
            onTap: () {
              JobController.to.inputSearchJob.value = 'Lentes de Contato';
              JobController.to.toSearchJobView();
            },
          ),
          CardCategoryHomeWidget(
            category: 'Terapia',
            onTap: () {
              JobController.to.inputSearchJob.value = 'Terapia';
              JobController.to.toSearchJobView();
            },
          ),
          CardCategoryHomeWidget(
            category: 'Depilação a led',
            onTap: () {
              JobController.to.inputSearchJob.value = 'Depilação';
              JobController.to.toSearchJobView();
            },
          ),
        ],
      ),
    );
  }
}
