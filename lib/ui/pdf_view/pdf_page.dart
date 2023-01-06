// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';

import 'package:lettutor_edu_clone/ui/pdf_view/pdf_controller.dart';

class PdfPage extends BasePage<PdfController> {
  @override
  Widget buildContentView(BuildContext context) {
    return PDF().cachedFromUrl(
      controller.url,
      placeholder: (progress) => Center(child: Text('$progress %')),
      errorWidget: (error) => Center(child: Text(error.toString())),
    );
  }
}
