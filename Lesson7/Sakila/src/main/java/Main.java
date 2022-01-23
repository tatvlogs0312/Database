import Controller.Controller;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Controller controller = new Controller();
        Scanner sc = new Scanner(System.in);
        Boolean isCheck = false;
        while (!isCheck){
            menu();
            System.out.print("Nhập lựa chọn : ");
            int choice = Integer.parseInt(sc.nextLine());
            switch (choice){
                case 1:
                    controller.getFilm();
                    break;
                case 2:
                    controller.getFilmActor();
                    break;
                case 3:
                    controller.getFilmTitle();
                    break;
                default:
                    System.out.println("Kết thúc chương trình!!!");
                    isCheck  = true;
            }
        }
    }
    public static void menu(){
        System.out.println("1 - Lấy ra phim có rating PG");
        System.out.println("2 - Lấy ra tên phim và diễn viên phim có tên chứa ACADEMY");
        System.out.println("3 - Tìm phim theo tên");
        System.out.println("Bấm số bất kì để thoát");
    }
}
