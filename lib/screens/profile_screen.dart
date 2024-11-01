import 'package:diet_planner/custom_widgets/profile_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            SvgPicture.asset("assets/icons/settings.svg"),
            const SizedBox(width: 24),
          ],
          centerTitle: false,
          title: Text(
            "  Profile",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/1472/ba18/d5dd2901a091b157ead9e8a08d529a72?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Cz88sc3tY7s2XS~EIf~YQ6FxOpa6oLvaciRvTeBksMIPNcdhAAN1JfzsNqgd4D3oT-UW0riyDNM7k42kDaJX2EqvCxxPS13nuQon1-1W3w~aLnx~W8J6TPH~O0e2bw2pOq8zdFmsd8U7hzwdZNVvQ~8JYpgNFTOkSxYALdvCTqXI1V0XOWgCzrrgzuYX6Yu1upNEbiZnfj1ii31Y7cH5-O8QtPvwGKIa0SZn7ScDDm-s0kRNs5msxt5lQAnyIbzRCSIa9k2m6g3aM-AcRb4NeBiyjFmfTrjMSua0nv40CVSZkLbaFvySQWITT4pc-6pCiKOs5wpY4IHyk9rSnEalZQ__",
                      height: 44,
                      width: 44,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mohammed Ali",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Mohamed@example.com",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF8C8C8C),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 114,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/wallet_panner.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 24,
                    left: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Charged : 01-01-2023",
                            style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                            )),
                        Text(
                          "Your Wallet",
                          style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF58634),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "280,00AED",
                              style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 28,
                    top: 30,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/send.svg",
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Manage",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const ProfileAction(iconPath: "assets/icons/bill.svg", name: "Orders"),
              const ProfileAction(
                  iconPath: "assets/icons/reserve_green.svg",
                  name: "Subscriptions"),
              const ProfileAction(
                  iconPath: "assets/icons/notification.svg",
                  name: "Notifications"),
              const ProfileAction(
                  iconPath: "assets/icons/group.svg", name: "Addresses"),
              const ProfileAction(
                  iconPath: "assets/icons/lovely.svg", name: "Wishlist"),
              const ProfileAction(
                  iconPath: "assets/icons/edit.svg", name: "Edit Profile"),
              const ProfileAction(
                  iconPath: "assets/icons/cup.svg", name: "Refer and earn"),
              const ProfileAction(
                  iconPath: "assets/icons/share.svg", name: "Share the app"),
              const ProfileAction(
                  iconPath: "assets/icons/star.svg", name: "Rate the app"),
              const ProfileAction(
                  iconPath: "assets/icons/information.svg",
                  name: "Report an issue"),
              const SizedBox(
                    height:15,
                  ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset("assets/icons/logout.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Logout",
                    style: GoogleFonts.poppins(color: const Color(0xFFF16063)),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
