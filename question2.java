public class Main {

    public static void main(String[] args) {
        String s=" Tempor ip";
        String str = "Lorem at";
        transform(s);
        transform(str);
        System.out.println(transform(s)); // change s to str for viewing the output of second testcase str
        System.out.println(transform(str));
    }

    public static String transform(String s){
        /**
         Given a string of length N ,This java function transforms the string by reversing characters
         in groups of four then return the transformed string
         * */
        char[] arr = new char[s.length()];  // Initializing the size of array n= s.length()
        int n=s.length();
        for(int i=0;i<n;i++){
            arr[i] = s.charAt(i);  // converting string to char
        }
        int sizeofarray = arr.length;  // size of char array
        int group = 4;  // the number opf groups pf char

        int i,charLeft,charRight;
        char temporaryStorage; // temporary storage of char in array

        for(  i=0;i<sizeofarray;i+=group){
            charLeft=i;
            charRight = Math.min(i+group-1,sizeofarray-1);  //  finding the min size of char in the right

            while(charLeft<charRight){  // executes if charLeft <charRight =true ONLY

                temporaryStorage = arr[charLeft]; // stores charleft in temporary memory
                arr[charLeft] = arr[charRight]; // charleft becomes a char at position charRight in arr[]
                arr[charRight] = temporaryStorage; // charRight stored in  the temporary memory
                charLeft+=1; // increasing count of charleft
                charRight-=1; // decreasing count charRight
            }
        }
        String str = String.valueOf(arr); // converts char array to string
        return(str);  // returns str that is string



    }
}


