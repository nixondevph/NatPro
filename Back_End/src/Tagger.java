import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.math.util.OpenIntToDoubleHashMap.Iterator;

import edu.stanford.nlp.ie.AbstractSequenceClassifier;
import edu.stanford.nlp.ie.crf.CRFClassifier;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.tagger.maxent.MaxentTagger;
import edu.stanford.nlp.util.Triple;
import net.didion.jwnl.JWNLException;

public class Tagger {
	public static boolean checkDocument(String uniqueID, String filename) throws IOException {
    	File dir = new File("texts\\");
        File[] files = dir.listFiles((dir1, name) -> name.startsWith(uniqueID) && name.endsWith(".pdf"));
        if(files.length == 0) {
        	new SaveFile(new File(filename), new File("texts\\"+uniqueID+".pdf"));
        	return true;
        }
        return false;
    }
	
	public Tagger(String filename) throws IOException, NoSuchAlgorithmException, ClassCastException, ClassNotFoundException, JWNLException {
		String uniqueID = new GenUniqueDocID2(filename).getUniqueID();
        
        if(checkDocument(uniqueID, filename) || true) {
        	String text = new PDFtoTXT(filename).convertedText();
            String cleanTxt = new TextCleaner(text).cleanText().getText();
            String txt = new SentenceSplitter(cleanTxt).getSentenceSplitText();
           
            /*
            txt = new CommonNameTagger("aka", txt).run();
            txt = new SpeciesTagger("plant", txt, "genus.txt").run();
            txt = new LocationTagger("loc", txt).run();
            txt = new BioActivityTagger("bioact", txt, "bioact.txt").run();
            txt = new SpeciesFamilyTagger("family", txt, "family.txt").run();
            txt = new OrgPartTagger("plantpart", txt, "orgpart.txt").run();
            txt = new CellLineTagger("cell", txt, "cell-lines.txt").run();
            txt = new CompoundClassTagger("class", txt, "compound-class.txt").run();
            txt = new BodyPartTagger("bodypart", txt, "bodypart.txt").run();
            txt = new PreparationTagger("prep", txt, "prep.txt").run();
            txt = new IllnessTagger("illness", txt, "illness.txt").run();*/
            txt = new CompoundTagger("compound", txt, "compound-suffix.txt", "20k.txt").run();
            
            /*
            
            new SortbyStringLength("compound-suffix.txt");
            
            tagger = new LookUpEntityTagger()
            		.setText(tagger.getText())
            		.setTag_name("compound")
            		.readLexiconFile("compound-suffix.txt")
            		.sortLexiconFile()
            		.hideTaggedEntities();
            
            CompoundTagger ct = new CompoundTagger().setText(tagger.getText());
            
            List<String> cc = ct.findEntities().sortEntities().getCompounds();
            
            for(int i=0; i<cc.size(); i++) {
            	tagger.getFound_entities().add(cc.get(i));
            }
            
            tagger.tagEntities();
            tagger.resolveHiddenEntities();
            
            //new CompoundTagger(tagger.hideTaggedEntities().getText(), "compound");
             */
            
            java.io.FileWriter fw = new java.io.FileWriter(uniqueID+".xml");
	        fw.write(txt);
	        fw.close();	
        }
	}
}