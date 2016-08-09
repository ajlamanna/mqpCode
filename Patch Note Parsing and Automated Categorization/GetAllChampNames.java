package sqlTest;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class GetAllChampNames {
	public static void main(String[] args){
		// The name of the file to open.
        //String notes = "patch_note_files/Aatrox_patch_notes.txt";
        //String categories = "categorized_patch_notes/Aatrox_categorized_patch_notes.txt";
        File notedir = new File("patch_note_files");
        File[] directoryListing = notedir.listFiles();
        File catdir = new File("categorized_patch_notes");
        File[] catdirectoryListing = catdir.listFiles();
        int currFile = 0;
        String output = "champs.txt";
        FileWriter fileWriter;
		try {
			fileWriter = new FileWriter(output);
			
			// Always wrap FileWriter in BufferedWriter.
	        BufferedWriter bufferedWriter =
	            new BufferedWriter(fileWriter);
	        
	        if (directoryListing != null) {
	        	for (File notes : directoryListing) {
	        		String name = notes.getName();
	        		name = name.replace("_patch_notes.txt", "");
	        		name = name.replace("_", " ");
	        		
	        		try{
	      	            bufferedWriter.write(name);
	      	            bufferedWriter.newLine();
		      	    }
	      	        catch(IOException ex) {
	      	            System.out.println(
	      	                "Error writing to file '"
	      	                + output + "'");
	      	            // Or we could just do this:
	      	            // ex.printStackTrace();
	      	        }
	        	}
				bufferedWriter.close();
	        }           
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        
        
        
	}
}
