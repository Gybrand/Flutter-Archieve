class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void lihatDaftarCourse() {
    print("Daftar Course milik $nama:");
    for (var course in daftarCourse) {
      print("${course.judul}: ${course.deskripsi}");
    }
  }
}

void main() {
  Course course1 = Course("Matematika", "Pelajaran matematika dasar");
  Course course2 = Course("Bahasa Inggris", "Pelajaran bahasa Inggris");

  Student student = Student("Fikli", "12");

  student.tambahCourse(course1);
  student.tambahCourse(course2);

  student.lihatDaftarCourse();

  student.hapusCourse(course1);

  student.lihatDaftarCourse();
}
