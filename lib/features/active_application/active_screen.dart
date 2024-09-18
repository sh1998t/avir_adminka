import 'package:flutter/material.dart';

class ActiveScreen extends StatefulWidget {
  const ActiveScreen({super.key});

  @override
  State<ActiveScreen> createState() => _ActiveScreenState();
}

class _ActiveScreenState extends State<ActiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 22,
            ),
            Container(
              height: 76,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF4C93E0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Активные заявки",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                NumberWidget(),
                SizedBox(width: 5),
                Widgets(
                    title: "GUID",
                    text: "0000000000000000",
                    width: 313,
                    height: 90),
                SizedBox(width: 5),
                Widgets(
                    title: "ФИО",
                    text: "Фамилия Имя Отчество",
                    width: 313,
                    height: 90),
                SizedBox(width: 5),
                Widgets(
                    title: "Статус", text: "Активно", width: 83, height: 90),
                SizedBox(width: 5),
                Widgets(
                    title: "Дата создания",
                    text: "12.01.2024",
                    width: 101,
                    height: 90),
                SizedBox(width: 5),
                CheckWidgets()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "№",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          width: 39,
          height: 600,
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    color: const Color(0xFFECECEC),
                    height: 90,
                    width: 39,
                    child: Center(
                      child: Text(
                        "0${index + 1}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class Widgets extends StatelessWidget {
  final String title;
  final String text;
  final double height;
  final double width;
  const Widgets(
      {super.key,
      required this.title,
      required this.text,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          width: width,
          height: 600,
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    color: const Color(0xFFECECEC),
                    height: height,
                    width: width,
                    child: Center(
                      child: Text(
                        text,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class CheckWidgets extends StatelessWidget {
  const CheckWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Квитанция/Чек',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          height: 600,
          width: 195,
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 90,
                    width: 210,
                    color: const Color(0xFFECECEC),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Скачать",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF0F8872)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 2,
                          color: const Color(0xFF176FCD),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Просмотреть',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF0F8872)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
