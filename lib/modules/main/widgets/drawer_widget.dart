import 'package:flutter/material.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/main/widgets/item_profile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    required double maxSlide,
    required CurvedAnimation animator,
    super.key,
  })  : _maxSlide = maxSlide,
        _animator = animator;

  final double _maxSlide;
  final CurvedAnimation _animator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _maxSlide,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF1F1D2B),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF2E1371),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF2E1371),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/29775873?v=4',
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chorn THOEN',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '098765432',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const ItemProfile(
                      title: 'Edit Account',
                      icon: Icons.edit,
                    ),
                    const CustomDivider(),
                    SizedBox(height: 24),
                    FrostedWidget(
                      height: 48,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      // color: Colors.deepPurple,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2E1371),
                            Color(0xFF2E1371).withOpacity(0.5),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            PhosphorIconsBold.magnifyingGlass,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Search',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: _animator,
                builder: (_, __) => Container(
                  width: _maxSlide,
                  color: Colors.black.withAlpha(
                    (150 * (1 - _animator.value)).floor(),
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
