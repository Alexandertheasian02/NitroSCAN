package findmultiples;

import static java.util.Arrays.sort;
import java.util.Random;

/**
 *
 * @author klaus
 */
public class FindMultiples {

    /*
     *Find an index where a value in the array occurs for the second time
     * Returns -1 if no such index exists
     */
    public static int findDuplicate(int[] numbers){
        for(int i = 0; i < numbers.length; i++)
            for(int j = 0; j < i; j++)
                if(numbers[i] == numbers[j])
                    return i;
	return -1;  // Failure case
    }

    /*
     * Find an index where a value in the array occurs for the third time
     * Returns -1 if no such index exists
     */
    public static int findTriplicate(int[] numbers){
        // naive version: O(n^3)
        /*
        for(int i = 0; i < numbers.length; i++)
            for(int j = 0; j < i; j++)
                for(int k = 0; k < j; k++)
                    if((numbers[j] == numbers[i]) && (numbers[k] == numbers[i]))
                            return i;
        */
        // Using a counter: O(n^2)
        for(int i = 0; i < numbers.length; i++){
            int count = 0;
            for(int j = 0; j < i; j++)
                if(numbers[i] == numbers[j]){
                    count++;
                    if(count == 2)  // 2 previous occurrences
                        return i;
                }
        }
        return -1;  // Failure case
    }

    /*
     * Find an index where a value in the sorted array occurs for the second time
     * Returns -1 if no such index exists
     */
    public static int findDuplicateSorted(int[] numbers){
        for(int i = 1; i < numbers.length; i++)
            if(numbers[i] == numbers[i-1])
                return i;
        return -1;  // Failure case
    }
    /*
     * Find an index where a value in the sorted array occurs for the third time
     * Returns -1 if no such index exists
     */
    public static int findTriplicateSorted(int[] numbers){
        for(int i = 2; i < numbers.length; i++)
            if((numbers[i] == numbers[i-1]) && (numbers[i] == numbers[i-2]))
                return i;
        return -1;  // Failure case
    }
    
    /*
     * Generates an array of the given size, containing random values
     * Range of numbers is bounded either by howMany or howMany*sqrt(howMany)
     */
    public static int[] randomValues(int howMany, boolean wideRange){
        int[] result = new int[howMany];
        int range = howMany;
        if(wideRange){
            int root = howMany / 2;
            for(int i=0; i<10; i++)
                root = (root + howMany/root) / 2;
            range *= root;
        }
        Random random = new Random();
        for(int i=0; i<howMany; i++)
           result[i] = random.nextInt() % range;
        return result;
    }

    /*
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // How many values to generate
        int numValues = 100; 
        // Whether to look for triplicate values
        boolean triplicates = false;
        // Whether to use sorted data
        boolean sortData = false;
        // Whether to print data. Only use with small numbers of values.
        boolean printData = true; 
        
        // Create some data, either sorted or unsorted
        int[] data = randomValues(numValues, !triplicates);
        if(sortData)
            sort(data);        
        // Optionally print the data (to check correctness)
        if(printData){
            System.out.print("Input values: ");
            for(int i=0;i<data.length; i++)
                System.out.print(data[i] + " ");
            System.out.println();
        }
        int result = 0;
       
        long start = System.currentTimeMillis();
        if(triplicates)
            if(sortData)
                result = findTriplicateSorted(data);
            else
                result = findTriplicate(data);
        else
            if(sortData)
                result = findDuplicateSorted(data);
            else
                result = findDuplicate(data);
        long now = System.currentTimeMillis();
        double elapsed = (now - start) / 1000.0;
        if(result >= 0)
            System.out.println("Result: " + result + " (value: " + data[result] + ")");
        else
            System.out.println("Result: nothing found");
        System.out.println("Elapsed time = " + elapsed + " seconds");        

    }
    
}
