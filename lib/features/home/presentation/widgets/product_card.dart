import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 183.w,
            height: 183.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: NetworkImage(productModel.image ?? ''),
              ),
            ),
          ),
          verticalSpace(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  productModel.title ?? "",
                  style: Styles.textTitle14SemiBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/rating_icon.svg'),
                  horizontalSpace(width: 5),
                  Text(
                    '${productModel.rating?.rate}',
                    style: Styles.textTitle12SemiBold,
                    overflow: TextOverflow.ellipsis,

                  ),
                ],
              ),
            ],
          ),
          verticalSpace(height: 3),
          Text(
            '${productModel.price ?? ''}',
            style: Styles.textTitle16SemiBold,
            overflow: TextOverflow.ellipsis,

          ),
        ],
      ),
    );
  }
}
