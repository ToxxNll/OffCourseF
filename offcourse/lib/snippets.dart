
class CardFb2 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const CardFb2(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 75,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Row(
            children: [
              Image.network(imageUrl, height: 59, fit: BoxFit.cover),
              const SizedBox(
                width: 15,
              ),
              Text(text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              const Spacer(),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            ],
          ),
        ),
    );
  }
}

CardFb2(text:"Explore", imageUrl:"https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555", subtitle:"+30 books",onPressed: (){},)




Container(
                                  //TeacherLine
                                  padding:
                                      EdgeInsets.only(left: 15, right: 15.0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CourseDetail(
                                                      selectedCourse: course,
                                                      assetPath: assetPath,
                                                      teacher: teachers,
                                                      about: about,
                                                      duration: duration,
                                                      language: language,
                                                      audience: audience,
                                                      requirements:
                                                          requirements,
                                                      name: name)));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 75,
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.accentColor1,
                                        borderRadius:
                                            BorderRadius.circular(12.5),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(10, 20),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              color:
                                                  Colors.grey.withOpacity(.05)),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'Lenturer',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18),
                                          ),
                                          const Spacer(),
                                          Text(teachers_data.name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ))