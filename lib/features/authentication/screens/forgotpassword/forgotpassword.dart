import "package:flutter/material.dart";
import "package:get/get.dart";


import "../../../../utils/constants/size.dart";
import "../../../../utils/validators/validator.dart";
import "../../controllers/forgotpasswordcontroller.dart";

    class Forgotpassword extends StatelessWidget {

      const Forgotpassword({super.key});

      @override
      Widget build(BuildContext context) {
        final controller=Get.put(Forgotpasswordcontroller());

        return Scaffold(body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
            child:Column(children: [Padding(padding: EdgeInsets.all(SSizes.spaceBtwSections)),
              Text("Forget Password",style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: SSizes.spaceBtwItem,),
              Text("Don't worry sometimes people can forget too,enter your email and we will send you password reset link ",
                style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: SSizes.spaceBtwSections,),
              Form(
                key:controller.forgetpasswordFormkey,
                  child:
                      TextFormField(
                          controller:controller.email,validator:SValidator.validateEmail,decoration: InputDecoration(labelText: 'email',prefixIcon: Icon(Icons.mail))),

                    ),
              SizedBox(height: SSizes.spaceBtwItem,),
              SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: (){ controller.sendPasswordResetEmail();}, child: Text('submit')),),

            ],) ,),
        ),);
      }
    }
