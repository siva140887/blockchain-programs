import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

// Merkle tree construction for a block comprising two transactions

class Merkle
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.println("TXN ID 1");
        String txn1 = sc.nextLine();
        System.out.println("TXN ID 1" + txn1);
        String hash1 = hash(txn1);
        System.out.println("HASH 1"+hash1);
        
        System.out.println("TXN ID 2");
        String txn2 = sc.nextLine();
        System.out.println("TXN ID 2" + txn2);
        String hash2 = hash(txn2);
        System.out.println("HASH 2"+hash2);
        
        String hashconhash = hash(hash1.concat(hash2));
        System.out.println("hashconhash (root hash)"+hashconhash);
        sc.close();
    }
    
    public static String hash(String input)
    {
        StringBuilder hashHexString = new StringBuilder();
        
        try
        {
            // Creating MessageDigest instance for SHA-256
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        
            // Converting input into byte array and computing hash
        byte[] hashByteArray = md.digest(input.getBytes());
        
            // Converting byte array into hex string
        for(byte b: hashByteArray)
        hashHexString.append(String.format("%02x",b));
        }
            // Checked exception must be handled
        catch(NoSuchAlgorithmException e)
        {
        System.out.println(e.getMessage());
        }
        
        return(hashHexString.toString());
    }
}

/*
Sample I/O:

TXN ID 1
0x2ac0ed520665ea5d950f1c6279d94ace8d8e5ca9bf5d1984d9f536ea9a294253
TXN ID 1 0x2ac0ed520665ea5d950f1c6279d94ace8d8e5ca9bf5d1984d9f536ea9a294253
HASH 1 daefe7b99ed21aca4c7bbe1002795f94aac3cffeb01d8c45607fc4911c2a7f38
TXN ID 2
0x7441127d4b8ef92425c4089ba6496cd86fdfe317b87b352c775e7cfdea51618f
TXN ID 2 0x7441127d4b8ef92425c4089ba6496cd86fdfe317b87b352c775e7cfdea51618f
HASH 2 bb366ae2b3a7b79a32b997f967d6c934142d7bb8d219392feea1aa42287f4ffc
hashconhash (root hash) 54cb49d7f07209b9728a0433c728713cdc729751fd3ad90e638f1aedf19c6979

=== Code Execution Successful ===

*/
