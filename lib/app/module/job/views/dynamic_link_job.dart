import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/text/header.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:adove/app/module/job/widgets/container_job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DynamicLinkJobsView extends StatelessWidget {
  final int? id;

  const DynamicLinkJobsView({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderTextWidget(),
            const Divider(),
            const Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'Faça login para poder marcar um horário',
                fontSize: kH2,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: JobController.to.jobsDynamicLink(id!),
                  builder: (context, snapshot) {
                    return _switchFutureBuilder(snapshot);
                  }),
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
        child: JobController.to.listJob != null &&
                JobController.to.listJob!.isNotEmpty
            ? ListView.builder(
                key: UniqueKey(),
                physics: const BouncingScrollPhysics(),
                itemCount: JobController.to.listJob!.length,
                itemBuilder: (context, index) {
                  return ContainerJobWidget(JobController.to.listJob![index]);
                },
              )
            : const Center(
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
