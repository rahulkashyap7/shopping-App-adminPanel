import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ecommerce_admin_panel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: RTexts.appName,
      themeMode: ThemeMode.light,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      getPages: RAppRoute.pages,
      initialRoute: RRoutes.firstScreen,
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => Scaffold(body: Center(child: Text('Page Not Found')))),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RSiteTemplate(
        useLayout: true,
        desktop: Desktop(),
        tablet: Tablet(),
        mobile: Mobile());
  }
}

class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// Top Section: BOX 1 (left) and BOX 2, 3, 4 (right, stacked)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BOX 1 - Tall vertical rectangle on the left
              Expanded(
                flex: 1,
                child: RRoundedContainer(
                  height: 450,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: const Center(child: Text('BOX 1')),
                ),
              ),
              const SizedBox(width: 20),
              // Right column with BOX 2, 3, 4 stacked
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    RRoundedContainer(
                      height: 140,
                      width: double.infinity,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: const Center(child: Text('BOX 2')),
                    ),
                    const SizedBox(height: 20),
                    RRoundedContainer(
                      height: 140,
                      width: double.infinity,
                      backgroundColor: Colors.pink.withOpacity(0.2),
                      child: const Center(child: Text('BOX 3')),
                    ),
                    const SizedBox(height: 20),
                    RRoundedContainer(
                      height: 140,
                      width: double.infinity,
                      backgroundColor: Colors.green.withOpacity(0.2),
                      child: const Center(child: Text('BOX 4')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// Bottom Section: BOX 5 and BOX 6 side by side
          Row(
            children: [
              Expanded(
                child: RRoundedContainer(
                  height: 190,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: const Center(child: Text('BOX 5')),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RRoundedContainer(
                  height: 190,
                  backgroundColor: Colors.purple.withOpacity(0.2),
                  child: const Center(child: Text('BOX 6')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// First Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    RRoundedContainer(
                      height: 450,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      child: const Center(child: Text('BOX 1')),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    RRoundedContainer(
                      height: 215,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: Center(child: Text('BOX 2')),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RRoundedContainer(
                  height: 450,
                  backgroundColor: Colors.yellow.withOpacity(0.2),
                  child: Center(child: Text('BOX 3')),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RRoundedContainer(
                  height: 450,
                  backgroundColor: Colors.yellow.withOpacity(0.2),
                  child: Center(child: Text('BOX 4')),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// Second Row
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RRoundedContainer(
                height: 190,
                width: double.infinity,
                backgroundColor: Colors.red.withOpacity(0.2),
                child: const Center(child: Text('BOX 5')),
              ),
              const SizedBox(height: 20),
              RRoundedContainer(
                height: 190,
                width: double.infinity,
                backgroundColor: Colors.red.withOpacity(0.2),
                child: const Center(child: Text('BOX 6')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// First Row
          RRoundedContainer(
            height: 450,
            width: double.infinity,
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: const Center(child: Text('BOX 1')),
          ),
          const SizedBox(height: 20),
          RRoundedContainer(
            height: 215,
            width: double.infinity,
            backgroundColor: Colors.orange.withOpacity(0.2),
            child: const Center(child: Text('BOX 2')),
          ),
          const SizedBox(height: 20),
          RRoundedContainer(
            height: 215,
            width: double.infinity,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('BOX 3')),
          ),
          const SizedBox(height: 20),
          RRoundedContainer(
            height: 215,
            width: double.infinity,
            backgroundColor: Colors.green.withOpacity(0.2),
            child: const Center(child: Text('BOX 4')),
          ),
          const SizedBox(height: 20),

          /// Second Row
          RRoundedContainer(
            height: 190,
            width: double.infinity,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('BOX 5')),
          ),
          const SizedBox(height: 20),
          RRoundedContainer(
            height: 190,
            width: double.infinity,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('BOX 6')),
          ),
        ],
      ),
    );
  }
}
