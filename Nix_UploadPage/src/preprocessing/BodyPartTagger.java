package preprocessing;
import java.io.IOException;

public class BodyPartTagger extends LookUpEntityTagger {

	public BodyPartTagger(String tag, String text, String filename) {
		super(tag, text, filename);
	}
	
	public String run() throws IOException {
		hideTaggedEntities();
		
		sortLexiconFile();
		readLexiconFile();
		
		compilePatternsInsensitive();
		
		findEntities();
		tagEntities();
		
		resolveHiddenEntities();
		removeOverlappingTags();
		
		printEntityFrequencyCount();
		
		return text;
	}
}