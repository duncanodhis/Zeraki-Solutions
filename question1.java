import java.util.Arrays; 
class Main {
  public static void main(String[] args) {
   int arr[] = {3,4,5,7};
    int  n=arr.length;//length ofthe array
    missingvalue(arr, n);//function to obtain the difference

  }

  public static int missingvalue(int array[],int n){
    int[] difference = new int[n]; // initializing differences of difference array
    Arrays.sort(array);  // sorting the array in ascending order
    int value=0;  // the missing value
     //finding the common difference 
    for(int i=0;i<n-1;i++){
    difference[i] = array[i+1]-array[i];
    }
    // Since the values are in a sequence ,the largest difference that is 
    //2 shows inconsistency within the array,this is where the missing value is found
    for(int j=0;j<n-1;j++){
      if(difference[j]==2){
        value=array[j]+1;
      }
    } 
    System.out.println(value);
     return (value);

  }
}
//time complexity  is O(N)