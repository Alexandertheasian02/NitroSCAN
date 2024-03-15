
import java.util.Random;

public class MergeSort {

    // Merge (sorted) ranges values[first]...values[mid] and values[mid+1]...values[last]
    private static void mergeRanges(int[] values, int first, int mid, int last){
        // TO DO: implement the merge function
        int size = last + 1 - first;
        int[] temp = new int[size];
        int index1 = first, index2 = mid+1, tempIndex = 0;
        // while both ranges have unused values, compare and pick lesser
        while(index1 <= mid && index2 <= last){
            if(values[index1] < values[index2]){
                temp[tempIndex] = values[index1];
                index1++;
            }
            else{
                temp[tempIndex] = values[index2];
                index2++;
            }
            tempIndex++;
        }
        // copy remaining unused values from whichever range has them
        while(index1 <= mid){
            temp[tempIndex] = values[index1];
            index1++;
            tempIndex++;
        }
        while(index2 <= last){
            temp[tempIndex] = values[index2];
            index2++;
            tempIndex++;
        }
        // copy values from temp back into range
        System.arraycopy(temp, 0, values, first, size);
    }


    // Auxiliary recursive function
    // Sorts the range values[first]...values[last]
    private static void sortRange(int[] values, int first, int last){
        if(last > first){    
            int mid = (first + last) / 2;
            sortRange(values, first, mid);      
            sortRange(values, mid + 1, last);   
            mergeRanges(values, first, mid, last); 
        }
    }

    public static void sort(int[] values){
        sortRange(values, 0, values.length - 1);
    }
    
    public static int[] randomValues(int howMany){
        int[] result = new int[howMany];
        Random random = new Random();
        for(int i=0; i<howMany; i++)
           result[i] = random.nextInt() % (10 * howMany);
        return result;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int numValues = 30; 
        boolean printResults = true; 
        
        
        int[] a = randomValues(numValues);
        if(printResults){
            System.out.print("Before sorting: ");
            for(int i=0;i<numValues; i++)
                System.out.print(a[i] + " ");
            System.out.println();
        }
        long start = System.currentTimeMillis();
        sort(a);
        long now = System.currentTimeMillis();
        double elapsed = (now - start) / 1000.0;
        if(printResults){
            System.out.print("After sorting: ");
            for(int i=0;i<numValues; i++)
                System.out.print(a[i] + " ");
            System.out.println();
        }
    	System.out.println();
        System.out.println("Elapsed time = " + elapsed + " seconds");    
    }    
}
