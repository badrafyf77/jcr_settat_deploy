import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/customs/button.dart';
import 'package:jcr_settat/core/utils/customs/text_field.dart';
import 'package:jcr_settat/core/utils/helpers/validators.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    super.key,
    required this.width,
  });

  final double width;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController nomCcontroller = TextEditingController();
  TextEditingController teleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    nomCcontroller.dispose();
    teleController.dispose();
    emailController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: widget.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextField(
                  controller: nomCcontroller,
                  hintText: 'Nom Complet',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrer le Nom Complet';
                    } else if (containsNumbers(value)) {
                      return 'Entrer un Nom Complet valide';
                    }
                    return null;
                  },
                  width: widget.width * 0.48,
                ),
                MyTextField(
                  controller: teleController,
                  hintText: 'Téléphone',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrer Numéro de Téléphone';
                    } else if (!isNumeric(value) || value.length > 14) {
                      return 'Entrer un Numéro Valide';
                    }
                    return null;
                  },
                  width: widget.width * 0.48,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: emailController,
              hintText: 'Adresse E-mail',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer E-mail';
                } else if (!isEmailValid(value)) {
                  return 'Entrer un E-mail Valide';
                }
                return null;
              },
              width: widget.width,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              isTextArea: true,
              controller: messageController,
              hintText: 'Message',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer n Message';
                }
                return null;
              },
              width: widget.width,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // BlocProvider.of<SendMessageBloc>(context).add(SendMessage(
                  //   nom: nomCcontroller.text,
                  //   telephone: teleController.text,
                  //   email: emailController.text,
                  //   message: messageController.text,
                  // ));
                  setState(() {
                    nomCcontroller.clear();
                    teleController.clear();
                    emailController.clear();
                    messageController.clear();
                  });
                }
              },
              textButton: 'CONTACTEZ-NOUS',
              backgroundColor: AppColors.kPrimaryColor,
              height: 35,
              width: widget.width,
            )
          ],
        ),
      ),
    );
  }
}
