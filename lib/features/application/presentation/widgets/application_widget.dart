import 'package:avir_app/core/enums/pref_keys.dart';
import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/core/utils/formatters/uppercase_formatter.dart';
import 'package:avir_app/features/application/data/models/user_info_request.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/presentation/bloc/application_bloc.dart';
import 'package:avir_app/features/screens/admin_screen.dart';
import 'package:avir_app/features/widgets/button.dart';
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

  @override
  void initState() {
    super.initState();
    _passSeriesController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _pinppController = TextEditingController();
    _passNumberController = TextEditingController();
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
    return BlocConsumer<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final PersonModel? user = state.userInfo;
        return Column(
          children: [
            const StepsWidget(),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
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
                  Visibility(
                    visible: isMethod1,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBack,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      height: 46,
                      width: size.width * 0.65,
                      child: DropdownButton<DocumentType>(
                        borderRadius: BorderRadius.circular(4),
                        isExpanded: true,
                        value: _documentType,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: const SizedBox.shrink(),
                        onChanged: (DocumentType? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            _documentType = value!;
                          });
                        },
                        items: types.map<DropdownMenuItem<DocumentType>>(
                            (DocumentType value) {
                          return DropdownMenuItem<DocumentType>(
                            value: value,
                            child: Text(
                              (value.key['key'] as String).tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isMethod1
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'serial_pass_number'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MainTextField(
                                          controller: _passSeriesController,
                                          textCapitalization:
                                              TextCapitalization.characters,
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
                                          controller: _passNumberController,
                                          keyboardType: TextInputType.number,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'date_of_birth'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    MainTextField(
                                      inputFormatters: [dateOfBirthFormatter],
                                      controller: _dateOfBirthController,
                                      hintText: 'dd.mm.yyyy',
                                      width: 202,
                                      height: 46,
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'pinfl'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                                MainTextField(
                                  controller: _pinppController,
                                  hintText: '00000000000000',
                                  width: 202,
                                  height: 74,
                                  maxLength: 14,
                                  onchange: (value) {
                                    if (value.length == 14) {
                                      FocusScope.of(context).nextFocus();
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
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Switch(
                            inactiveThumbColor: AppColors.unselectedColor,
                            trackOutlineColor: WidgetStateProperty.resolveWith(
                              (final Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
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
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Switch(
                            inactiveThumbColor: AppColors.unselectedColor,
                            trackOutlineColor: WidgetStateProperty.resolveWith(
                              (final Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
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
                  MyButton(
                    isLoading: state.isLoading,
                    text: 'check'.tr(),
                    onPressed: () {
                      context.read<ApplicationBloc>().add(
                            ApplicationEvent.getUserInfo(
                              UserInfoRequest(
                                pinpp: _pinppController.text,
                                serialNumber:
                                    "${_passSeriesController.text}${_passNumberController.text}",
                                parents: _parents,
                                address: _address,
                                documentType: _documentType.key["id"],
                                // dateBirth: _dateOfBirthController.text,

                                // dateBirth: _dateOfBirthController.text,
                              ),
                            ),
                          );
                    },
                    width: double.infinity,
                    height: 58,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
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
                        title: 'Район рождения',
                        value: user?.person.patronymCirillic ?? "",
                        valueTwo: user?.person.patronymLatin ?? "",
                        valueThree: user?.person.patronymEnglish ?? "",
                      ),
                      const SizedBox(width: 10),
                      InfoWidgetTwo(
                        height: 117,
                        width: 335,
                        title: 'Район рождения',
                        value: user?.person.patronymCirillic ?? "",
                        valueTwo: user?.person.patronymLatin ?? "",
                        valueThree: user?.person.patronymEnglish ?? "",
                      ),
                      const SizedBox(width: 10),
                      InfoWidgetTwo(
                        height: 117,
                        width: 335,
                        title: 'Район рождения',
                        value: user?.person.patronymCirillic ?? "",
                        valueTwo: user?.person.patronymLatin ?? "",
                        valueThree: user?.person.patronymEnglish ?? "",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      InfoWidget(
                        width: 251,
                        title: 'дате рождения ',
                        value: user?.person.dateBirth ?? "",
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      InfoWidget(
                        title: 'пол ',
                        value: user?.person.sex.value ?? "",
                        width: 130,
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      InfoWidget(
                        title: 'Национальность ',
                        value: user?.person.nationality.value ?? " ",
                        width: 130,
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      InfoWidget(
                        title: 'Гражданство ',
                        value: user?.person.citizenship.value ?? "",
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
                        title: 'Территория рождения ',
                        value: user?.person.birthRegion.value ?? "",
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      InfoWidget(
                        width: 335,
                        title: 'Область рождения',
                        value: user?.person.birthRegion.value ?? "",
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      InfoWidget(
                        width: 335,
                        title: 'Район рождения ',
                        value: user?.person.birthDistrict.value ?? "",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  InfoWidgetTwo(
                      width: MediaQuery.of(context).size.width - 20,
                      title: 'Район рождения',
                      value: "КИРИЛИЦА",
                      valueTwo: "(ЛАТЫНИЦА)",
                      valueThree: "(АНГЛ)")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    this.width,
    this.height,
    required this.value,
  });

  final String title;
  final double? width;
  final double? height;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          height: height ?? 46,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.textFieldBack),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}

class InfoWidgetTwo extends StatelessWidget {
  const InfoWidgetTwo({
    super.key,
    required this.title,
    this.width,
    this.height,
    required this.value,
    required this.valueTwo,
    required this.valueThree,
  });

  final String title;
  final double? width;
  final double? height;
  final String value;
  final String valueTwo;
  final String valueThree;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width ?? 320,
          height: height ?? 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.textFieldBack),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                valueTwo,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                valueTwo,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}
