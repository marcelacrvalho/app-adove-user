import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/text/header.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:adove/app/module/job/widgets/container_job.dart';
import 'package:adove/app/module/job/widgets/search_job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchJobView extends StatelessWidget {
  const SearchJobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const HeaderTextWidget(),
            SearchJobWidget(),
            const Divider(),
            Obx(
              () => JobController.to.inputSearchJob.value != ''
                  ? Expanded(
                      flex: 2,
                      child: FutureBuilder(
                          future: JobController.to.search(),
                          builder: (context, snapshot) {
                            return _switchFutureBuilder(snapshot);
                          }),
                    )
                  : Flexible(
                      child: Lottie.asset(
                        'assets/animations/animation-loading.json',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switchFutureBuilder(AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Lottie.asset('assets/animations/animation-loading.json');
      case ConnectionState.active:
      case ConnectionState.done:
        return _jobsList();
    }
  }

  Widget _jobsList() {
    return Obx(
      () => Scrollbar(
        child: JobController.to.listSearchJob != null &&
                JobController.to.listSearchJob!.isNotEmpty
            ? ListView.builder(
                key: UniqueKey(),
                physics: const BouncingScrollPhysics(),
                itemCount: JobController.to.listSearchJob!.length,
                itemBuilder: (context, index) {
                  return ContainerJobWidget(
                      JobController.to.listSearchJob![index]);
                },
              )
            : Center(
                child: TextWidget(
                  text: 'Infelizmente, ainda não há nada aqui :(',
                  fontSize: kH2,
                  fontColor: Colors.grey,
                ),
              ),
      ),
    );
  }
}
