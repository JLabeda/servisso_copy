import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_drawer.dart';
import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const ServissoDrawer(),
      drawerScrimColor: Colors.transparent,
      appBar: ServissoAppBar(
        leadingWidget: GestureDetector(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(24),
              ),
            ),
            width: 16,
            child: const Icon(
              Icons.menu,
              size: 32,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: GridView.count(
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(ServissoRoutes.myCars.name),
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.myCars,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.myServices,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
