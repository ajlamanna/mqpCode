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

public class ConvertTexttoSqlText {
	public static void main(String[] args){
		// The name of the file to open.
        //String notes = "patch_note_files/Aatrox_patch_notes.txt";
        //String categories = "categorized_patch_notes/Aatrox_categorized_patch_notes.txt";
        File notedir = new File("patch_note_files");
        File[] directoryListing = notedir.listFiles();
        File catdir = new File("categorized_patch_notes");
        File[] catdirectoryListing = catdir.listFiles();
        File nameFile = new File("champs.txt");
        int currFile = 0;
        ArrayList<String> nameArray = new ArrayList<String>();
        try {
        	FileReader nameReader = 
  	            new FileReader(nameFile);
        	BufferedReader nameBuffer = 
      	            new BufferedReader(nameReader);
        	String line = null;
        	while((line = nameBuffer.readLine()) != null) {
        		nameArray.add(line);
        	}
        	for(String n: nameArray){
        		System.out.println(n);
        	}
        	
        	nameBuffer.close(); 
        }
    	catch(IOException ex) {
            System.out.println(
                "Error writing to file");
            // Or we could just do this:
            // ex.printStackTrace();
        }
        
        if (directoryListing != null) {
        	for (File notes : directoryListing) {
        		//if(currFile>2)
        		//	break;
	        	
	        	String output = "default.txt";
	      	    
	      	    // This will reference one line at a time
	      	    String line = null;
	      	    
	      	    String name = "default";
	      	    String patch = "";
	      	    ArrayList<String> noteArray = new ArrayList<String>();
	      	    ArrayList<String> CArray = new ArrayList<String>();
	      	
	      	    try {
	      	    	
	      	        // FileReader reads text files in the default encoding.
	      	        FileReader fileReaderN = 
	      	            new FileReader(notes);
	      	        FileReader fileReaderC = 
	      	                new FileReader(catdirectoryListing[currFile]);
	      	        
	      	        // Always wrap FileReader in BufferedReader.
	      	        BufferedReader bufferedReaderN = 
	      	            new BufferedReader(fileReaderN);
	      	        BufferedReader bufferedReaderC = 
	      	                new BufferedReader(fileReaderC);
	      	
	      	        while((line = bufferedReaderN.readLine()) != null) {
	      	        	name = nameArray.get(currFile);
	      	        	/*name = line;
	      	        	System.out.println("Name: "+name);
	      	        	if(line.substring(3).equals("Aatrox")||
	      	        			line.substring(3).equals("Darius")||
	      	        			line.substring(3).equals("Ekko")||
	      	        			line.substring(3).equals("Elise")){
	      	        		name = line.substring(3); //Notepad puts a weird encoding character at the start of some champions' files
	      	        	}*/
	      	        	while((line = bufferedReaderN.readLine()) != null) {
	      	        		if(!line.isEmpty())
	      	        			noteArray.add(line);
	      	        		output = name+".txt";
	      	        	}
	      	        }   
	      	        System.out.print(currFile);
	      	        System.out.print(name);
	      	        
	      	        for(int k=0;k<noteArray.size();k++){
	      	        	if (noteArray.get(k).substring(0, 1).equals(" "))
	      	        		noteArray.set(k, noteArray.get(k).substring(1));
	      	        	//System.out.println(noteArray.get(k));
	      	        }
	      	        
	      	        
	      	        while((line = bufferedReaderC.readLine()) != null) {
	      	        	if(!line.isEmpty())
	      	    			CArray.add(line);
	      	        }
	      	        
	      	        for(int l=0;l<CArray.size();l++){
	      	        	if (CArray.get(l).substring(0, 1).equals(" "))
	      	        		CArray.set(l, CArray.get(l).substring(1));
	      	        	//System.out.println(CArray.get(l));
	      	        }
	      	        
	      	        for(String l:CArray){
	      	        	//System.out.println(l);
	      	        }
	      	        currFile++;
	      	        
	      	        try {
	      	            // Assume default encoding.
	      	            FileWriter fileWriter =
	      	                new FileWriter(output);
	      	
	      	            // Always wrap FileWriter in BufferedWriter.
	      	            BufferedWriter bufferedWriter =
	      	                new BufferedWriter(fileWriter);
	      	            
	      	            //bufferedWriter.write("Input files:"+ notes.getName() + catdirectoryListing[currFile].getName());
	      	
	      	            // Note that write() does not automatically
	      	            // append a newline character.
	      	            /*
	      	            for(int i=0;i<noteArray.size();i=+2){
	      	            	bufferedWriter.write(noteArray.get(i+1));
	      	            	bufferedWriter.write("\t");
	      	            	bufferedWriter.write(name);
	      	            	bufferedWriter.write("\t");
	      	            	bufferedWriter.write(CArray.get(i+1));
	      	            	bufferedWriter.write("\t");
	      	            	bufferedWriter.write(noteArray.get(i));
	      	            	bufferedWriter.newLine();
	      	            }
	      	            */
	      	            
	      	            int noteIndex = 0;
	      	            int categoryIndex = 0;
	      	            
	      	            for(noteIndex=0;noteIndex<noteArray.size();noteIndex++){
	      	            	//System.out.println("Printing line "+noteIndex);
	      	            	//System.out.println("Line: "+noteArray.get(noteIndex));
	      	            	if(noteArray.get(noteIndex).contains("Added")&&noteArray.get(noteIndex).contains(":")){
	      	            		patch = noteArray.get(noteIndex);
	      	            		if(patch.contains(":"))
	      	            			patch = patch.substring(0,patch.indexOf(":"));
	      	            		categoryIndex++;
	      	            		for(int j=noteIndex+1;j<noteArray.size();j++){
	      	            			System.out.print(noteArray.get(j)+" ");
	      	            			bufferedWriter.write(noteArray.get(j)+" ");
	      	            			
	      	            		}
	      	            		/*System.out.print("\t");
	      	        			System.out.print(name);
	      	                	System.out.print("\t");
	      	        			System.out.print(CArray.get(categoryIndex));
	      	        			System.out.print("\t");
	      	                	System.out.print(patch);
	      	                	System.out.println();
	      	                	*/
	      	                	bufferedWriter.write("\t");
	      	                	bufferedWriter.write(name);
	      	                	bufferedWriter.write("\t");
	      	                	bufferedWriter.write(CArray.get(categoryIndex));
	      	                	bufferedWriter.write("\t");
	      	                	bufferedWriter.write(patch);
	      	                	bufferedWriter.newLine();
	      	            		break;
	      	            	}
	      	            	else if((noteArray.get(noteIndex).contains("Alpha")&&noteArray.get(noteIndex).contains(":"))||
	      	            			(noteArray.get(noteIndex).contains("Hotfix")&&noteArray.get(noteIndex).contains(":"))||
	      	            			(noteArray.get(noteIndex).contains("Patch")&&noteArray.get(noteIndex).contains(":"))||
	      	            			(noteArray.get(noteIndex).contains("V")&&noteArray.get(noteIndex).contains(":")&&noteArray.get(noteIndex).contains("."))){
	      	            		patch = noteArray.get(noteIndex);
	      	                	patch = patch.substring(0,patch.indexOf(":"));
	      	            		categoryIndex++;
	      	            		
	      	            	}
	      	            	else{
	      	            		
	      	            		System.out.print(noteIndex);
	      	            		System.out.print(categoryIndex);
	      	                	System.out.print(noteArray.get(noteIndex));
	      	                	System.out.print("\t");
	      	                	System.out.print(name);
	      	                	System.out.print("\t");
	      	                	System.out.print(CArray.get(categoryIndex));
	      	                	System.out.print("\t");
	      	                	System.out.print(patch);
	      	                	System.out.println();
	      	                	
	      	                	bufferedWriter.write(noteArray.get(noteIndex));
	      	                	bufferedWriter.write("\t");
	      	                	bufferedWriter.write(name);
	      	                	bufferedWriter.write("\t");
	      	                	bufferedWriter.write(CArray.get(categoryIndex));
	      	                	bufferedWriter.write("\t");
	      	                	bufferedWriter.write(patch);
	      	                	bufferedWriter.newLine();
	      	                	categoryIndex++;
	      	            	}
	      	            }
	      	            // Always close files.
	      	            bufferedWriter.close();
	      	        }
	      	        catch(IOException ex) {
	      	            System.out.println(
	      	                "Error writing to file '"
	      	                + output + "'");
	      	            // Or we could just do this:
	      	            // ex.printStackTrace();
	      	        }
	      	
	      	        // Always close files.
	      	        bufferedReaderN.close();   
	      	        bufferedReaderC.close(); 
	      	    }
	      	    catch(FileNotFoundException ex) {
	      	        System.out.println(
	      	            "Unable to open file 'notes'");                
	      	    }
	      	    catch(IOException ex) {
	      	        System.out.println(
	      	            "Error reading file 'notes'");                  
	      	        // Or we could just do this: 
	      	        // ex.printStackTrace();
	      	    }
	
        	}
        }           
	}
}
