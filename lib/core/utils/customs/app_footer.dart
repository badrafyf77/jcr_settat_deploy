import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/constants.dart';
import 'package:jcr_settat/core/utils/customs/horizontal_line.dart';
import 'package:jcr_settat/core/utils/customs/logo.dart';
import 'package:jcr_settat/core/utils/customs/views_title.dart';
import 'package:jcr_settat/core/utils/helpers/launch_url.dart';
import 'package:jcr_settat/core/utils/styles.dart';
import 'package:jcr_settat/features/contact/presentation/widgets/info.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const HorizontalLine(
            height: .5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
            child: isMobile
                ? const Column(
                    children: [
                      FooterBrandInfo(),
                      SizedBox(height: 15),
                      FooterMenu(),
                      SizedBox(height: 15),
                      FooterContactInfo(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FooterBrandInfo(),
                      ),
                      Expanded(
                        child: FooterMenu(),
                      ),
                      Expanded(
                        child: FooterContactInfo(),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 0.5,
            width: double.infinity,
            color: Colors.grey,
          ),
          const FooterSocialMedia(),
        ],
      ),
    );
  }
}

class FooterSocialMedia extends StatelessWidget {
  const FooterSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaItem(
              onPressed: () {},
              icon: Icons.facebook,
              backgroundColor: Colors.blue,
            ),
            const SizedBox(width: 10),
            SocialMediaItem(
              onPressed: () {
                // customLaunchUrl(Constants.eventsWeekInstagram);
              },
              icon: FontAwesomeIcons.instagram,
              backgroundColor: const Color(0xFFD72072),
            ),
            const SizedBox(width: 10),
            SocialMediaItem(
              onPressed: () {},
              icon: FontAwesomeIcons.linkedin,
              backgroundColor: Colors.blue,
            ),
            const SizedBox(width: 10),
            SocialMediaItem(
              onPressed: () {},
              icon: FontAwesomeIcons.xTwitter,
              backgroundColor: Colors.grey,
            ),
          ],
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          "© 2025 Jeunesse Citoyenne Ras El Aïn - Tous droits réservés",
          style: Styles.normal12.copyWith(
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Propulsé par:',
              style: Styles.normal14.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                customLaunchUrl(Constants.afyfLinkedIn);
              },
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                padding: EdgeInsets.zero,
                overlayColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
              ),
              child: AutoSizeText(
                '  AFYF Badreddine',
                style: Styles.normal12.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class FooterBrandInfo extends StatelessWidget {
  const FooterBrandInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppLogo(),
        AutoSizeText(
          "Jeunesse Citoyenne Ras El Aïn est une association locale à but non lucratif, fondée par un groupe de jeunes engagés souhaitant contribuer positivement à la société.",
          style: Styles.normal14,
        ),
      ],
    );
  }
}

class FooterContactInfo extends StatelessWidget {
  const FooterContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ViewsTitle(
          title: "CONTACT INFO",
          fontSize: 18,
          lineWidth: 150,
          withLogo: false,
        ),
        SizedBox(height: 10),
        ContactWidget(
          icon: Icons.mail,
          text: 'contact@jeunesse-citoyenne-ras-elayn-settat.ma',
        ),
        ContactWidget(
          icon: Icons.phone,
          text: '+212 6 00 00 00 00',
        ),
        ContactWidget(
          icon: Icons.web,
          text: "www.jeunesse-citoyenne-ras-elayn-settat.ma",
        ),
      ],
    );
  }
}

class FooterMenu extends StatelessWidget {
  const FooterMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ViewsTitle(
          title: "MENU",
          fontSize: 18,
          lineWidth: 60,
          withLogo: false,
        ),
        const SizedBox(height: 10),
        TextButton(
          child: AutoSizeText(
            "Acceuil",
            style: Styles.normal12.copyWith(
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.home);
          },
        ),
        TextButton(
          child: AutoSizeText(
            "A Propos",
            style: Styles.normal12.copyWith(
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.about);
          },
        ),
        TextButton(
          child: AutoSizeText(
            "Partenaires",
            style: Styles.normal12.copyWith(
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.partners);
          },
        ),
      ],
    );
  }
}

class SocialMediaItem extends StatefulWidget {
  const SocialMediaItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
  });

  final void Function() onPressed;
  final IconData icon;
  final Color backgroundColor;

  @override
  State<SocialMediaItem> createState() => _SocialMediaItemState();
}

class _SocialMediaItemState extends State<SocialMediaItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: isHovering ? widget.backgroundColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: widget.onPressed,
          icon: Icon(
            widget.icon,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
