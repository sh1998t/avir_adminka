import 'package:avir_app/core/service/number_to_text.dart';
import 'package:avir_app/core/utils/format/text_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:avir_app/features/application/data/models/invoice_model.dart';

class PdfService {
  Future<void> printCustomersPdf(InvoiceResponse data) async {
    final doc = pw.Document();
    final font = await PdfGoogleFonts.robotoRegular();
    final String today = DateFormat("dd.MM.yyyy").format(DateTime.now());
    final String textAmountDuk =
        ConvertService().toWords(data.data?.invoiceDUK?.amount ?? 0);
    final String textAmountIdCart =
        ConvertService().toWords(data.data?.invoiceIDCard?.amount ?? 0);

    doc.addPage(pw.Page(
        margin: const pw.EdgeInsets.all(20),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    child: pw.Column(children: [
                      pw.Text('ХАБАРНОМА',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тулиқ туланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тўлиқ тўланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        '${FormatText().moneyFormat(data.data?.invoiceDUK?.amount.toString() ?? "0")} сум',
                        style: pw.TextStyle(
                            color: PdfColor.fromRYB(1, 0, 0, 1),
                            font: font,
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(today,
                          style: pw.TextStyle(font: font, fontSize: 14)),
                      pw.SizedBox(height: 10),
                      pw.Text("Хазиначи",
                          style: pw.TextStyle(font: font, fontSize: 14)),
                    ], crossAxisAlignment: pw.CrossAxisAlignment.start),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                        bottom: pw.BorderSide(
                          width: 1,
                        ),
                        right: pw.BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const pw.EdgeInsets.only(right: 10, bottom: 10)),
                pw.SizedBox(width: 10),
                pw.Container(
                  child: pw.Column(
                    children: [
                      pw.Container(
                        width: 430,
                        child: pw.Text(
                          'Ички ишлар вазирлиги',
                          style: pw.TextStyle(font: font),
                        ),
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Row(
                        children: [
                          pw.SizedBox(
                              width: 80,
                              child: pw.Text(
                                'Банк номи',
                                style: pw.TextStyle(font: font, fontSize: 12),
                              )),
                          pw.Container(
                            child: pw.Text(
                              'Марказий банк Тошкент шаҳар Бош бошқармаси ҲККМ',
                              style: pw.TextStyle(font: font, fontSize: 12),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Олувчининг ҳисобрақами',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 180,
                          child: pw.Text(
                            data.data?.invoiceDUK?.budgetAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Text('Банк коди', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 5),
                        pw.Container(
                          width: 40,
                          child: pw.Text(
                            data.data?.invoiceDUK?.mfo.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Ғазна ҳисобварағи',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 140,
                          child: pw.Text(
                            data.data?.invoiceDUK?.treasuryAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 40),
                        pw.Text('СТИР', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 10),
                        pw.Container(
                          width: 60,
                          child: pw.Text(
                            data.data?.invoiceDUK?.inn.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.SizedBox(
                        width: 430,
                        child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(data.data?.invoiceDUK?.owner ?? "",
                                  style: pw.TextStyle(
                                      font: font,
                                    )),
                              pw.Text(
                                data.data?.invoiceDUK?.serialNumber ?? "",
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      pw.Container(
                        width: 430,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(width: 2),
                          ),
                        ),
                      ),
                      pw.Row(children: [
                        pw.Container(
                          width: 250,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Тўлов тури',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 50,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Санаси',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 100,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Пул миқдори',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.Row(
                        children: [
                          pw.Container(
                            width: 250,
                            padding: const pw.EdgeInsets.all(3),
                            child: pw.Text(
                              'Ўзбекистон фуқароси ID картасини олиш',
                              style: pw.TextStyle(font: font),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            width: 80,
                            height: 20,

                            child: pw.Center(
                              child: pw.Text(
                                DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
                                style: pw.TextStyle(font: font),
                              ),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            width: 100,
                            height: 20,

                            child: pw.Center(
                              child: pw.Text(
                                FormatText().moneyFormat(
                                    data.data?.invoiceDUK?.amount.toString() ??
                                        ""),
                                style: pw.TextStyle(
                                    font: font,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      pw.SizedBox(
                        width: 400,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            "$textAmountDuk сум",
                            style: pw.TextStyle(font: font),
                          ),
                        ),
                      ),
                    ],
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                  ),
                )
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Divider(thickness: 3),
            pw.SizedBox(height: 5),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    child: pw.Column(children: [
                      pw.Text('ХАБАРНОМА',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тулиқ туланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тўлиқ тўланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        '${FormatText().moneyFormat(data.data?.invoiceDUK?.amount.toString() ?? "0")} сум',
                        style: pw.TextStyle(
                            color: PdfColor.fromRYB(1, 0, 0, 1),
                            font: font,
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(today,
                          style: pw.TextStyle(font: font, fontSize: 14)),
                      pw.SizedBox(height: 10),
                      pw.Text("Хазиначи",
                          style: pw.TextStyle(font: font, fontSize: 14)),
                    ], crossAxisAlignment: pw.CrossAxisAlignment.start),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                        bottom: pw.BorderSide(
                          width: 1,
                        ),
                        right: pw.BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const pw.EdgeInsets.only(right: 10, bottom: 10)),
                pw.SizedBox(width: 10),
                pw.Container(
                  child: pw.Column(
                    children: [
                      pw.Container(
                        width: 430,
                        child: pw.Text(
                          'Ички ишлар вазирлиги',
                          style: pw.TextStyle(font: font),
                        ),
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Row(
                        children: [
                          pw.SizedBox(
                              width: 80,
                              child: pw.Text(
                                'Банк номи',
                                style: pw.TextStyle(font: font, fontSize: 12),
                              )),
                          pw.Container(
                            child: pw.Text(
                              'Марказий банк Тошкент шаҳар Бош бошқармаси ҲККМ',
                              style: pw.TextStyle(font: font, fontSize: 12),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Олувчининг ҳисобрақами',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 180,
                          child: pw.Text(
                            data.data?.invoiceDUK?.budgetAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Text('Банк коди', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 5),
                        pw.Container(
                          width: 40,
                          child: pw.Text(
                            data.data?.invoiceDUK?.mfo.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Ғазна ҳисобварағи',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 140,
                          child: pw.Text(
                            data.data?.invoiceDUK?.treasuryAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 40),
                        pw.Text('СТИР', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 10),
                        pw.Container(
                          width: 60,
                          child: pw.Text(
                            data.data?.invoiceDUK?.inn.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.SizedBox(
                        width: 430,
                        child: pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(data.data?.invoiceDUK?.owner ?? "",
                                  style: pw.TextStyle(
                                    font: font,
                                  )),
                              pw.Text(
                                data.data?.invoiceDUK?.serialNumber ?? "",
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      pw.Container(
                        width: 430,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(width: 2),
                          ),
                        ),
                      ),
                      pw.Row(children: [
                        pw.Container(
                          width: 200,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Тўлов тури',
                              style: pw.TextStyle(font: font),
                            ),
                          ),

                        ),
                        pw.Container(
                          width: 80,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Санаси',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 100,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Пул миқдори',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.Container(
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(
                              width: 1,
                            ),
                            right: pw.BorderSide(
                              width: 1,
                            ),top: pw.BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                        child: pw.Row(
                        children: [
                          pw.Container(
                            width: 200,
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                            padding: const pw.EdgeInsets.all(3),
                            child: pw.Row(children: [
                              pw.Text(
                                'Ўзбекистон фуқароси ID картасини олиш',
                                style: pw.TextStyle(font: font, fontSize: 10),
                              ),
                              pw.Container(
                                width: 80,
                                child: pw.Center(
                                  child: pw.Text(
                                    DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
                                    style: pw.TextStyle(font: font),
                                  ),
                                ),
                              ),
                              pw.Container(
                                width: 100,
                                child: pw.Center(
                                  child: pw.Text(
                                    FormatText().moneyFormat(
                                        data.data?.invoiceDUK?.amount.toString() ??
                                            ""),
                                    style: pw.TextStyle(
                                        font: font,
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),

                              ),
                            ]),

                          ),


                        ],
                      ),),

                      pw.SizedBox(
                        width: 400,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            "$textAmountDuk сум",
                            style: pw.TextStyle(font: font),
                          ),
                        ),
                      ),
                    ],
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                  ),
                )
              ],
            ),
            pw.Divider(thickness: 3),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    child: pw.Column(children: [
                      pw.Text('ХАБАРНОМА',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тулиқ туланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тўлиқ тўланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        '${FormatText().moneyFormat(data.data?.invoiceIDCard?.amount.toString() ?? "0")} сум',
                        style: pw.TextStyle(
                            color: PdfColor.fromRYB(1, 0, 0, 1),
                            font: font,
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(today,
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 20),
                      pw.Text("Хазиначи",
                          style: pw.TextStyle(font: font, fontSize: 12)),
                    ], crossAxisAlignment: pw.CrossAxisAlignment.start),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                        bottom: pw.BorderSide(
                          width: 1,
                        ),
                        right: pw.BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const pw.EdgeInsets.only(right: 10, bottom: 10)),
                pw.SizedBox(width: 10),
                pw.Container(
                  child: pw.Column(
                    children: [
                      pw.Container(
                        width: 430,
                        child: pw.Text(
                          'Ички ишлар вазирлиги',
                          style: pw.TextStyle(font: font),
                        ),
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Row(
                        children: [
                          pw.SizedBox(
                              width: 80,
                              child: pw.Text(
                                'Банк номи',
                                style: pw.TextStyle(font: font),
                              )),
                          pw.Container(
                            child: pw.Text(
                              'Марказий банк Тошкент шаҳар Бош бошқармаси ҲККМ',
                              style: pw.TextStyle(font: font),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Олувчининг ҳисобрақами',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 180,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.budgetAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text('Банк коди', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 10),
                        pw.Container(
                          width: 40,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.mfo.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Ғазна ҳисобварағи',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 140,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.treasuryAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 40),
                        pw.Text('СТИР', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 10),
                        pw.Container(
                          width: 60,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.inn.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.SizedBox(
                        width: 430,
                        child: pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(data.data?.invoiceIDCard?.owner ?? "",
                                  style: pw.TextStyle(
                                    font: font,
                                  )),
                              pw.Text(
                                data.data?.invoiceIDCard?.serialNumber ?? "",
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      pw.Container(
                        width: 430,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(width: 2),
                          ),
                        ),
                      ),
                      pw.Row(children: [
                        pw.Container(
                          width: 250,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Тўлов тури',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 50,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Санаси',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 100,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Пул миқдори',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.Row(
                        children: [
                          pw.Container(
                            width: 250,
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(
                              'Ўзбекистон фуқароси ID картасини олиш',
                              style: pw.TextStyle(font: font),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            width: 50,
                            height: 25,
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Center(
                              child: pw.Text(
                                '',
                                style: pw.TextStyle(font: font),
                              ),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            width: 100,
                            height: 25,
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Center(
                              child: pw.Text(
                                FormatText().moneyFormat(
                                    data.data?.invoiceIDCard?.amount.toString() ??
                                        ""),
                                style: pw.TextStyle(
                                    font: font,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 5),
                      pw.SizedBox(
                        width: 400,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            "$textAmountIdCart сум",
                            style: pw.TextStyle(font: font),
                          ),
                        ),
                      ),
                    ],
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                  ),
                )
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Divider(thickness: 3),
            pw.SizedBox(height: 5),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    child: pw.Column(children: [
                      pw.Text('ХАБАРНОМА',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тулиқ туланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text('Тўлиқ тўланган',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        '${FormatText().moneyFormat(data.data?.invoiceIDCard?.amount.toString() ?? "0")} сум',
                        style: pw.TextStyle(
                            color: PdfColor.fromRYB(1, 0, 0, 1),
                            font: font,
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(today,
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      pw.SizedBox(height: 20),
                      pw.Text("Хазиначи",
                          style: pw.TextStyle(font: font, fontSize: 12)),
                    ], crossAxisAlignment: pw.CrossAxisAlignment.start),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                        bottom: pw.BorderSide(
                          width: 1,
                        ),
                        right: pw.BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const pw.EdgeInsets.only(right: 10, bottom: 10)),
                pw.SizedBox(width: 10),
                pw.Container(
                  child: pw.Column(
                    children: [
                      pw.Container(
                        width: 430,
                        child: pw.Text(
                          'Ички ишлар вазирлиги',
                          style: pw.TextStyle(font: font),
                        ),
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Row(
                        children: [
                          pw.SizedBox(
                              width: 80,
                              child: pw.Text(
                                'Банк номи',
                                style: pw.TextStyle(font: font),
                              )),
                          pw.Container(
                            child: pw.Text(
                              'Марказий банк Тошкент шаҳар Бош бошқармаси ҲККМ',
                              style: pw.TextStyle(font: font),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Олувчининг ҳисобрақами',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 180,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.budgetAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text('Банк коди', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 10),
                        pw.Container(
                          width: 40,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.mfo.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.Row(children: [
                        pw.SizedBox(
                          width: 150,
                          child: pw.Text(
                            'Ғазна ҳисобварағи',
                            style: pw.TextStyle(
                              font: font,
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 140,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.treasuryAccount.toString() ??
                                "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.SizedBox(width: 40),
                        pw.Text('СТИР', style: pw.TextStyle(font: font)),
                        pw.SizedBox(width: 10),
                        pw.Container(
                          width: 60,
                          child: pw.Text(
                            data.data?.invoiceIDCard?.inn.toString() ?? "",
                            style: pw.TextStyle(font: font),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.SizedBox(height: 5),
                      pw.SizedBox(
                        width: 430,
                        child: pw.Row(
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(data.data?.invoiceIDCard?.owner ?? "",
                                  style: pw.TextStyle(
                                    font: font,
                                  )),
                              pw.Text(
                                data.data?.invoiceIDCard?.serialNumber ?? "",
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      pw.Container(
                        width: 430,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            bottom: pw.BorderSide(width: 2),
                          ),
                        ),
                      ),
                      pw.Row(children: [
                        pw.Container(
                          width: 250,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Тўлов тури',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 50,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Санаси',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                              right: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          width: 100,
                          padding: const pw.EdgeInsets.all(5),
                          child: pw.Center(
                            child: pw.Text(
                              'Пул миқдори',
                              style: pw.TextStyle(font: font),
                            ),
                          ),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.Row(
                        children: [
                          pw.Container(
                            width: 250,
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(
                              'Ўзбекистон фуқароси ID картасини олиш',
                              style: pw.TextStyle(font: font),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            width: 50,
                            height: 25,
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Center(
                              child: pw.Text(
                                '',
                                style: pw.TextStyle(font: font),
                              ),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            width: 100,
                            height: 25,
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Center(
                              child: pw.Text(
                                FormatText().moneyFormat(
                                    data.data?.invoiceIDCard?.amount.toString() ??
                                        ""),
                                style: pw.TextStyle(
                                    font: font,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 5),
                      pw.SizedBox(
                        width: 400,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            "$textAmountIdCart сум",
                            style: pw.TextStyle(font: font),
                          ),
                        ),
                      ),
                    ],
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                  ),
                )
              ],
            ),

          ]); // Center
        })); // Page
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
