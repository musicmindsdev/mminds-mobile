// // ignore_for_file:  prefer_asserts_with_message
//
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    required this.imageType,
    this.imageUrl,
    super.key,
    this.height = 50,
    this.width = 50,
    this.placeHolderColor = AppColors.kPrimaryColor,
    this.editImage = false,
    this.onEditImageTap,
    this.onDeleteImageTap,
    this.showBorder = false,
  }) : assert(
          !(editImage == true && onEditImageTap == null && onDeleteImageTap == null),
        );

  final double height;
  final double width;
  final String? imageUrl;
  final ProfileImageType imageType;
  final Color placeHolderColor;
  final bool editImage;
  final void Function()? onEditImageTap;
  final void Function()? onDeleteImageTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: showBorder ? Border.all() : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              height: height,
              width: width,
              imageUrl: imageUrl ?? '',
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, DownloadProgress progress) {
                return SizedBox.fromSize(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    backgroundColor: AppColors.kWhite,
                  ),
                );
              },
              errorWidget: (context, url, __) => SvgPicture.asset(
                (imageType == ProfileImageType.user)
                    ? 'assets/images/organization.svg'
                    : 'assets/images/person.svg',
                // ignore: deprecated_member_use
                color: placeHolderColor,
              ),
              // placeholder: (context, url) => SvgPicture.asset(
              //   (imageType == ProfileImageType.organization)
              //       ? AppAsset.organizationIcon
              //       : AppAsset.personIcon,
              //   // ignore: deprecated_member_use
              //   color: placeHolderColor,
              // ),
            ),
          ),
        ),
        // Visibility(
        //   visible: editImage,
        //   child: Positioned(
        //     right: 0,
        //     top: 0,
        //     child: Container(
        //       height: 30,
        //       width: 30,
        //       decoration: BoxDecoration(
        //         color: AppColors.kPrimaryColor,
        //         borderRadius: BorderRadius.circular(100),
        //         border: Border.all(color: AppColors.kWhite),
        //       ),
        //       alignment: Alignment.center,
        //       child: PopupMenuButton(
        //         tooltip: 'Edit Image',
        //         child: SvgPicture.asset(
        //           AppAsset.editProfileImage,
        //           height: 15,
        //           width: 15,
        //         ),
        //         itemBuilder: (context) {
        //           return <PopupMenuEntry<dynamic>>[
        //             PopupMenuItem(
        //               onTap: onEditImageTap,
        //               child: const Text('Change profile picture',),
        //             ),
        //             const PopupMenuDivider(),
        //             PopupMenuItem(
        //               onTap: onDeleteImageTap,
        //               child: const Text('Delete profile picture',
        //                 style: TextStyle(color: AppColors.red,),
        //               ),
        //             ),
        //           ];
        //         },
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
