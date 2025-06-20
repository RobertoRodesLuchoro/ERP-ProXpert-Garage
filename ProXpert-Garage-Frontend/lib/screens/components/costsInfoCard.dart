import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class CostsInfoCard extends StatelessWidget {
  final String svgSrc, title, costsOfStuff, numOfStuff;
  final bool isDark;
  final Color? iconColor;

  const CostsInfoCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.costsOfStuff,
    required this.numOfStuff,
    required this.isDark,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icono
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor?.withOpacity(0.1) ?? Colors.white24,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              svgSrc,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            ),
          ),

          const SizedBox(width: defaultPadding),

          // Título + subtítulo + importe
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Column con título y subtítulo
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        numOfStuff,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: isDark ? Colors.white54 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                // Precio centrado verticalmente
                Text(
                  costsOfStuff,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




