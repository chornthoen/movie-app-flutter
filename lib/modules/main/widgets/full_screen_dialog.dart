import 'dart:ui';

import 'package:flutter/material.dart';


class LabelAndAction extends StatefulWidget {
  const LabelAndAction({
    super.key, this.text, this.onPressed,
  });

  final String? text;
  final VoidCallback? onPressed;

  @override
  State<LabelAndAction> createState() => _LabelAndActionState();
}

class _LabelAndActionState extends State<LabelAndAction> {
  final List<String> categories = [
    'Movies',
    'Series',
    'Short Films',
    'TV Shows',
    'Kids',
    'Music',
    'Karaoke',
    'Anime',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            widget.text ?? '',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: widget.onPressed,
            child: Text(
              'View all',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFF12CDD9),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showBottomSheetFullScreen(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FullScreenDialog(categories: categories);
      },
    );
  }
}
class FullScreenDialog extends StatelessWidget {

  const FullScreenDialog({required this.categories, super.key});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black.withOpacity(0.6),
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: const Duration(milliseconds: 800),
      alignment: Alignment.center,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            children: [
              Text(
                'All Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 16),
                          GestureDetector(
                            child: Text(
                              categories[index],
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              // Handle category selection if needed
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}