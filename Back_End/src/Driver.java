import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.ling.HasWord;
import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;
import edu.stanford.nlp.tagger.maxent.MaxentTagger;
import edu.stanford.nlp.util.CoreMap;
import net.didion.jwnl.JWNLException;

public class Driver {

	public static void main(String[] args) throws NoSuchAlgorithmException, ClassCastException, ClassNotFoundException, IOException, JWNLException, ParserConfigurationException, SAXException {
		// TODO Auto-generated method stub
		long startTime, endTime;
        startTime = System.nanoTime();
		
        
        new Tagger("de.pdf");
		new Tagger("am.pdf");
        new Tagger("ap.pdf");
        new Tagger("hm.pdf");
        
        new Tagger("dg.pdf");
        new Tagger("pn.pdf");
        new Tagger("bo.pdf");
        
		endTime = System.nanoTime();
        System.err.println("Duration: "+ ((double)(endTime - startTime)) / 1000000 + " ms");
        System.err.println("Duration: "+ ((double)(endTime - startTime)) / 1000000000 + " s");
	}

}
