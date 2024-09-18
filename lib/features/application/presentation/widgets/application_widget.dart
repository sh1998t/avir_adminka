import 'package:avir_app/core/constants/moc_data.dart';
import 'package:avir_app/core/enums/id_cart_type.dart';
import 'package:avir_app/core/enums/pref_keys.dart';
import 'package:avir_app/core/service/pdf_service.dart';
import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/core/utils/formatters/uppercase_formatter.dart';
import 'package:avir_app/features/application/data/models/invoice_model.dart';
import 'package:avir_app/features/application/data/models/user_info_request.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/presentation/bloc/application_bloc.dart';
import 'package:avir_app/features/application/presentation/widgets/info_widget.dart';
import 'package:avir_app/features/application/presentation/widgets/steps_widget.dart';
import 'package:avir_app/features/widgets/button.dart';
import 'package:avir_app/features/widgets/error_dialog.dart';
import 'package:avir_app/features/widgets/main_outline_button.dart';
import 'package:avir_app/features/widgets/textfield_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';




class ApplicationWidget extends StatefulWidget {
  const ApplicationWidget({super.key});

  @override
  State<ApplicationWidget> createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  DocumentType _documentType = DocumentType.passport;
  bool _parents = false;
  bool _address = false;
  bool isMethod1 = true;
  late final TextEditingController _passSeriesController;
  late final TextEditingController _passNumberController;
  late final TextEditingController _dateOfBirthController;
  late final TextEditingController _pinppController;
  final MaskTextInputFormatter dateOfBirthFormatter = MaskTextInputFormatter(
      mask: '##.##.####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final List<DocumentType> types = [DocumentType.id, DocumentType.passport];
  int currentStep = 0;
  IdCartEnum _selectedIdCartType = IdCartEnum.idCard;

  @override
  void initState() {
    super.initState();
    _passSeriesController = TextEditingController(text: 'AC');
    _dateOfBirthController = TextEditingController(text: '27.12.2003');
    _pinppController = TextEditingController();
    _passNumberController = TextEditingController(text: '2628601');
  }

  @override
  void dispose() {
    super.dispose();
    _passNumberController.dispose();
    _passSeriesController.dispose();
    _dateOfBirthController.dispose();
    _pinppController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 70,
      child: BlocConsumer<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          if (state.error != null) {
            showDialog(
                context: context,
                builder: (context) => ErrorDialog(error: state.error!));
          }
        },
        builder: (context, state) {
          final PersonModel? user = state.userInfo;
          return Column(
            children: [
              StepsWidget(
                step: currentStep,
              ),
              const SizedBox(
                height: 22,
              ),
              MainOutlineButton(isActive: true, title: 'Print', onPressed: (){
                final InvoiceResponse response = InvoiceResponse.fromJson(MockData.paymentData);
                PdfService().printCustomersPdf(response);
              }),
              Expanded(
                child: PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'select_type_application'.tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                MainOutlineButton(
                                  isActive: isMethod1,
                                  title: '${'method'.tr()} 1',
                                  onPressed: () {
                                    setState(() {
                                      isMethod1 = true;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 22,
                                ),
                                MainOutlineButton(
                                  isActive: !isMethod1,
                                  title: '${'method'.tr()} 2',
                                  onPressed: () {
                                    setState(() {
                                      isMethod1 = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                isMethod1
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'serial_pass_number'.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MainTextField(
                                                    controller:
                                                        _passSeriesController,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .characters,
                                                    hintText: "AA",
                                                    width: 50,
                                                    height: 46,
                                                    inputFormatters: [
                                                      UpperCaseTextFormatter()
                                                    ],
                                                    onchange: (value) {
                                                      if (value.length == 2) {
                                                        FocusScope.of(context)
                                                            .nextFocus();
                                                      }
                                                    },
                                                  ),
                                                  MainTextField(
                                                    controller:
                                                        _passNumberController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    hintText: '000000',
                                                    width: 202,
                                                    height: 46,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    onchange: (value) {
                                                      if (value.length == 7) {
                                                        FocusScope.of(context)
                                                            .nextFocus();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 22,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'date_of_birth'.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              MainTextField(
                                                inputFormatters: [
                                                  dateOfBirthFormatter
                                                ],
                                                controller:
                                                    _dateOfBirthController,
                                                hintText: 'dd.mm.yyyy',
                                                width: 202,
                                                height: 46,
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'pinfl'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          MainTextField(
                                            controller: _pinppController,
                                            hintText: '00000000000000',
                                            width: 202,
                                            height: 74,
                                            maxLength: 14,
                                            onchange: (value) {
                                              if (value.length == 14) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                const SizedBox(
                                  width: 22,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'address'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Switch(
                                      inactiveThumbColor:
                                          AppColors.unselectedColor,
                                      trackOutlineColor:
                                          WidgetStateProperty.resolveWith(
                                        (final Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.selected)) {
                                            return null;
                                          }

                                          return AppColors.unselectedColor;
                                        },
                                      ),
                                      value: _address,
                                      onChanged: (value) {
                                        setState(() {
                                          _address = value;
                                        });
                                      },
                                      activeColor: AppColors.primary,
                                    ),
                                    const SizedBox(
                                      width: 22,
                                    ),
                                    Text(
                                      'parent_info'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Switch(
                                      inactiveThumbColor:
                                          AppColors.unselectedColor,
                                      trackOutlineColor:
                                          WidgetStateProperty.resolveWith(
                                        (final Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.selected)) {
                                            return null;
                                          }

                                          return AppColors.unselectedColor;
                                        },
                                      ),
                                      value: _parents,
                                      onChanged: (value) {
                                        setState(() {
                                          _parents = value;
                                        });
                                      },
                                      activeColor: AppColors.primary,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Visibility(
                              visible: user != null,
                              child: Column(
                                children: [
                                  const Divider(
                                    color: AppColors.divider,
                                    thickness: 3,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      InfoWidget(
                                        width: 312,
                                        title: 'GUID',
                                        value: user?.person.guid ?? "",
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      InfoWidget(
                                        title: 'pinfl'.tr(),
                                        value: user?.person.pinpp ?? "",
                                        width: 151,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      InfoWidgetTwo(
                                        height: 117,
                                        width: 335,
                                        title: 'name'.tr(),
                                        value: user?.person.nameCirillic ?? "",
                                        valueTwo: user?.person.nameLatin ?? "",
                                        valueThree:
                                            user?.person.nameEnglish ?? "",
                                      ),
                                      const SizedBox(width: 10),
                                      InfoWidgetTwo(
                                        height: 117,
                                        width: 335,
                                        title: 'surname'.tr(),
                                        value:
                                            user?.person.patronymCirillic ?? "",
                                        valueTwo:
                                            user?.person.patronymLatin ?? "",
                                        valueThree:
                                            user?.person.patronymEnglish ?? "",
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      InfoWidget(
                                        width: 251,
                                        title: 'date_of_birth'.tr(),
                                        value: user?.person.dateBirth ?? "",
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      InfoWidget(
                                        title: 'gender'.tr(),
                                        value: user?.person.sex.value ?? "",
                                        width: 130,
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      InfoWidget(
                                        title: 'nationality'.tr(),
                                        value: user?.person.nationality.value ??
                                            " ",
                                        width: 130,
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      InfoWidget(
                                        title: 'citizenship'.tr(),
                                        value: user?.person.citizenship.value ??
                                            "",
                                        width: 472,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      InfoWidget(
                                        width: 335,
                                        title: 'birth_territory'.tr(),
                                        value: user?.person.birthRegion.value ??
                                            "",
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      InfoWidget(
                                        width: 335,
                                        title: 'birth_region'.tr(),
                                        value: user?.person.birthRegion.value ??
                                            "",
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      InfoWidget(
                                        width: 335,
                                        title: 'birth_district'.tr(),
                                        value:
                                            user?.person.birthDistrict.value ??
                                                "",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                              visible: user != null,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.textFieldBack,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: 46,
                                width: size.width * 0.65,
                                child: DropdownButton<IdCartEnum>(
                                  borderRadius: BorderRadius.circular(4),
                                  isExpanded: true,
                                  value: _selectedIdCartType,
                                  elevation: 16,
                                  style:
                                  const TextStyle(color: Colors.deepPurple),
                                  underline: const SizedBox.shrink(),
                                  onChanged: (IdCartEnum? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      _selectedIdCartType = value!;
                                    });
                                  },
                                  items: IdCartEnum.values
                                      .map<DropdownMenuItem<IdCartEnum>>(
                                          (IdCartEnum value) {
                                        return DropdownMenuItem<IdCartEnum>(
                                          value: value,
                                          child: Text(
                                            (value.key['name'] as String).tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyButton(
                              isLoading: state.isLoading,
                              text: user == null
                                  ? 'check'.tr()
                                  : 'create_application'.tr(),
                              onPressed: () {
                                context.read<ApplicationBloc>().add(
                                      ApplicationEvent.getUserInfo(
                                        isMethod1
                                            ? UserInfoRequest(
                                                serialNumber:
                                                    "${_passSeriesController.text}${_passNumberController.text}",
                                                parents: _parents,
                                                address: _address,
                                                doctype:
                                                    _documentType.key["id"],
                                                dateBirth:
                                                    _dateOfBirthController.text,

                                                // dateBirth: _dateOfBirthController.text,
                                              )
                                            : UserInfoWithUUIDRequest(
                                                parents: _parents,
                                                address: _address,
                                                pinpp: _pinppController.text),
                                      ),
                                    );
                              },
                              width: double.infinity,
                              height: 58,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }


}
