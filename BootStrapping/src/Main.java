import edu.stanford.nlp.tagger.maxent.MaxentTagger;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdk.internal.org.xml.sax.SAXException;
import net.didion.jwnl.JWNL;
import net.didion.jwnl.data.IndexWord;
import net.didion.jwnl.data.POS;
import net.didion.jwnl.data.Synset;
import net.didion.jwnl.data.Word;
import net.didion.jwnl.dictionary.Dictionary;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;


public class Main {

    public static void main(String[] args) {

        File Folder = new File("TaggedSample/");
        File[] listFiles = Folder.listFiles();
        Reader fileReader = null;
        String e1=null; String e2=null;
        TreeSet<String> relation = new TreeSet<String>();
        String V = "(.*)_VB[A-Z]*(.*)";
        String W = "(.*)_[DJNPR][NJBTR]P*(.*)";
        String P = "(.*)_[IRT][NPO](.*)";



        for(File xmlFile : listFiles) {

            File seedFolder = new File("SeedsPossible/");
            File[] seedList = seedFolder.listFiles();
            for(File seeds: seedList) {

                String seedData = readFile(seeds, fileReader).toString();
                String[] seedLines = seedData.split("\\r?\\n");
                ArrayList<String> seedEntity = new ArrayList<String>();
                for(String sling: seedLines){
                    seedEntity.add(sling);
                }

                //entity retrieval
                e1 = getTag(seedEntity.get(0));
                e2 = getTag(seedEntity.get(1));

                HashMap<String, String> seedMap = new HashMap<String, String>();
                for(int i=3; i<seedEntity.size(); i++){
                    addMap(seedMap,seedEntity,i);
                }

                String xml2String = readFile(xmlFile, fileReader).toString();
                String[] lines = xml2String.split("\\r?\\n");


                for(String class1 : seedMap.keySet()){
                    String class2 = seedMap.get(class1);
                    class1 = class1.toLowerCase();
                    class2 = class2.toLowerCase();
                    for (String pLine : lines) {
                        pLine = pLine.toLowerCase();
                        addRelation(relation,pLine,class1,class2,e1,e2);
                    }//end of pLine loop
                }//end of class1 loop

                /*for(String test: relation){
                    System.out.println(test);
                }*/



            }//end of seeds loop

            TreeSet<String> seedPattern = new TreeSet<String>();

            // POS TAGGER
            for(String rLine: relation){
                //System.out.println("relation: "+rLine);
                POSTagger(seedPattern,rLine,V,P,W);
            }

            ArrayList<String> seedAL = new ArrayList<String>();
            for(String temp: seedPattern){
                seedAL.add(temp);
            }



            String POSrelationship = "";
            /*for(int i = seedAL.size()-1;i >= 0;i--){
                if(POSrelationship.compareTo("") == 0)
                    POSrelationship= POSrelationship.concat(seedAL.get(i));
                else
                    POSrelationship= POSrelationship.concat(" "+seedAL.get(i));
            }*/




            TreeSet<String> Verbmatches = new TreeSet<String>();
            TreeSet<String> Vmatches = new TreeSet<String>();
            TreeSet<String> Pronounmatches = new TreeSet<String>();
            TreeSet<String> Pmatches = new TreeSet<String>();
            TreeSet<String> Wordmatches = new TreeSet<String>();
            TreeSet<String> Wmatches = new TreeSet<String>();


            for(String seedWord: seedPattern){
                try {
                    MaxentTagger tagger =  new MaxentTagger("models/english-left3words-distsim.tagger");
                    String tagged = tagger.tagString(seedWord);
                    String temp = tagged.substring(tagged.indexOf("_")+1);
                    //System.out.println(temp);

                    // initialize JWNL (this must be done before JWNL can be used)
                    JWNL.initialize(new FileInputStream("file_properties.xml"));
                    IndexWord word = null;
                    if(tagged.matches(V)){
                        word = Dictionary.getInstance().lookupIndexWord(POS.VERB, seedWord);
                        Verbmatches.add(seedWord);
                    }else if(tagged.matches(P)){
                        word = Dictionary.getInstance().lookupIndexWord(POS.ADVERB, seedWord);
                        Pronounmatches.add(seedWord);
                    }else if(tagged.matches(W)){
                        word = Dictionary.getInstance().lookupIndexWord(POS.ADJECTIVE, seedWord);
                        Wordmatches.add(seedWord);
                    }
                    Synset synset[] = word.getSenses();

                    for(int i=0;i<synset.length;i++){
                        //System.out.println(word.getSenses());
                        for(Word synonym : synset[i].getWords())
                        {
                            if(tagged.matches(V)){
                                Vmatches.add(synonym.getLemma());



                            }else if(tagged.matches(P)){
                                Pmatches.add(synonym.getLemma());


                            }else if(tagged.matches(W)){
                                Wmatches.add(synonym.getLemma());


                            }
                            //matches.add(synonym.getLemma());
                            //System.out.println(synonym.getLemma());
                        }
                        //System.out.println(" ");
                    }


                    //matches.clear();

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                //System.out.println(seedWord);
            }//End of wordnet loop

            /*for(String temp: Verbmatches){
                //System.out.println(temp);
            }

            System.out.println();
            for(String temp: Pronounmatches){
                //System.out.println(temp);
            }

            for(String temp: Wordmatches){
                //System.out.println(temp);
            }*/





            TreeSet<String> matches = new TreeSet<String>();
            TreeSet<String> validation = new TreeSet<String>();

            //CHECKS IF THE GENERATED XML FILE EXISTS
            DocumentBuilderFactory factory=  DocumentBuilderFactory.newInstance();
            try {
                DocumentBuilder builder =  factory.newDocumentBuilder();
                /*=======================================================================================================
                =======================================================================================================
                                                NOTE: CHECK IF FOLDER EXISTS
                =======================================================================================================
                 =======================================================================================================*/
                Document doc = builder.parse("seedOutput/"+e1+"-"+e2+".xml");
                doc.getDocumentElement().normalize();
                //System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
                NodeList nodeList = doc.getElementsByTagName("Seed");
                for(int i = 0; i< nodeList.getLength();i++) {
                    Node nNode = nodeList.item(i);
                    //System.out.println("Node Name: " + nNode.getNodeName());
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        //System.out.println("I am here");
                        Element eElement = (Element) nNode;
                        int eCount= eElement.getElementsByTagName("Pattern").getLength();
                        for(int j=0; j<eCount;j++){
                            //System.out.println(eElement.getElementsByTagName("Pattern").item(j).getTextContent());
                            matches.add(eElement.getElementsByTagName("Pattern").item(j).getTextContent());
                        }

                    }
                }
            } catch (ParserConfigurationException | IOException e) {
                e.printStackTrace();
            } catch (org.xml.sax.SAXException e) {
                e.printStackTrace();
            }
            //====================================================================================================================
            //For validation XML
            //====================================================================================================================
            DocumentBuilderFactory Vfactory=  DocumentBuilderFactory.newInstance();
            try {
                DocumentBuilder builder =  Vfactory.newDocumentBuilder();
                /*=======================================================================================================
                =======================================================================================================
                                                NOTE: CHECK IF FOLDER EXISTS
                =======================================================================================================
                 =======================================================================================================*/
                Document doc = builder.parse("validation/"+e1+"-"+e2+".xml");
                doc.getDocumentElement().normalize();
                //System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
                NodeList nodeList = doc.getElementsByTagName("Seed");
                for(int i = 0; i< nodeList.getLength();i++) {
                    Node nNode = nodeList.item(i);
                    //System.out.println("Node Name: " + nNode.getNodeName());
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        //System.out.println("I am here");
                        Element eElement = (Element) nNode;
                        int eCount= eElement.getElementsByTagName("Pattern").getLength();
                        for(int j=0; j<eCount;j++){
                            //System.out.println(eElement.getElementsByTagName("Pattern").item(j).getTextContent());
                            validation.add(eElement.getElementsByTagName("Pattern").item(j).getTextContent());
                        }

                    }
                }
            } catch (ParserConfigurationException | IOException e) {
                e.printStackTrace();
            } catch (org.xml.sax.SAXException e) {
                e.printStackTrace();
            }




            //matches.add(POSrelationship);//adding the POS Tagged relationship to the generated seed patterns
            //System.out.println("WordMatches: "+ Wmatches);
            if(Wmatches .isEmpty() ){
                for(String i: Vmatches){
                    for(String j: Pmatches){
                        matches.add(i+" "+j);
                    }
                }
            }
            else{
                for(String i: Vmatches){
                    for(String j: Wmatches) {
                        for (String k : Pmatches) {
                            matches.add(i + " " + j+ " "+ k);
                        }
                    }
                }
            }
            //String deleteTest = "";//ADD THESE FOR THE DELETE FUNCTION
            if(Wordmatches.isEmpty() ){
                for(String i: Verbmatches){
                    for(String j: Pronounmatches){
                        validation.add(i+" "+j);
                        matches.add(i+" "+j);
                        //deleteTest = i+" " +j;//ADD THESE FOR THE DELETE FUNCTION
                    }
                }
            }
            else{
                for(String i: Verbmatches){
                    for(String j: Wordmatches) {
                        for (String k : Pronounmatches) {
                            validation.add(i + " " + j+ " "+ k);
                            matches.add(i + " " + j+ " "+ k);
                        }
                    }
                }
            }






            /*====================================================================================================================
            ====================================================================================================================
            ====================================================================================================================
                                            DELETE SPECIFIC ITEMS IN XML FILE
                                            CHECK LINE 289 AND 295 FOR TESTING
            ====================================================================================================================
             ====================================================================================================================
             ====================================================================================================================*/
           /* DocumentBuilderFactory Deletefactory=  DocumentBuilderFactory.newInstance();
            try {
                DocumentBuilder builder =  Deletefactory.newDocumentBuilder();
                Document doc = builder.parse("validation/"+e1+"-"+e2+".xml");
                doc.getDocumentElement().normalize();
                //System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
                NodeList nodeList = doc.getElementsByTagName("Seed");
                for(int i = 0; i< nodeList.getLength();i++) {
                    Node nNode = nodeList.item(i);
                    //System.out.println("Node Name: " + nNode.getNodeName());
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        //System.out.println("I am here");
                        Element eElement = (Element) nNode;
                        int eCount= eElement.getElementsByTagName("Pattern").getLength();
                        for(int j=0; j<eCount;j++){
                            //System.out.println("Delete Test:"+eElement.getElementsByTagName("Pattern").item(j).getTextContent());
                            //validation.add(eElement.getElementsByTagName("Pattern").item(j).getTextContent());
                            if(eElement.getElementsByTagName("Pattern").item(j).getTextContent().equals(deleteTest)){
                                eElement.getElementsByTagName("Pattern").item(j).getParentNode().removeChild(eElement.getElementsByTagName("Pattern").item(j));
                                //System.out.println(eElement.getElementsByTagName("Pattern").item(j).getTextContent()+ " is Deleted Successfully");
                            }
                        }

                    }
                }
                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(doc);

                StreamResult streamResult = new StreamResult("validation/"+e1+"-"+e2+".xml");
                transformer.transform(source,streamResult);

            } catch (ParserConfigurationException | IOException e) {
                e.printStackTrace();
            } catch (org.xml.sax.SAXException e) {
                e.printStackTrace();
            } catch (TransformerConfigurationException e) {
                e.printStackTrace();
            } catch (TransformerException e) {
                e.printStackTrace();
            }*/


            for(String temp: matches){
                //System.out.println(temp);
            }

            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            try {
                DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
                Document document = documentBuilder.newDocument();


                Element element = document.createElement("Seed");
                document.appendChild(element);

                Element A = document.createElement("Tag1");
                A.appendChild(document.createTextNode(e1));
                element.appendChild(A);

                Element B = document.createElement("Tag2");
                B.appendChild(document.createTextNode(e2));
                element.appendChild(B);

                Element C = document.createElement("Relation");
                //C.appendChild(document.createTextNode(ms));
                element.appendChild(C);
                for(String ms: matches) {
                    Element D = document.createElement("Pattern");
                    D.appendChild(document.createTextNode(ms));
                    C.appendChild(D);
                }

                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(document);

                StreamResult streamResult = new StreamResult("seedOutput/"+e1+"-"+e2+".xml");
                transformer.transform(source,streamResult);

            } catch (ParserConfigurationException | TransformerException e) {
                e.printStackTrace();
            }

            /*=======================================================================================================
                                                CREATION OF VALIDATION XML
             =======================================================================================================*/

            DocumentBuilderFactory docBuildFactory = DocumentBuilderFactory.newInstance();
            try {
                DocumentBuilder documentBuilder = docBuildFactory.newDocumentBuilder();
                Document document = documentBuilder.newDocument();


                Element element = document.createElement("Seed");
                document.appendChild(element);

                Element A = document.createElement("Tag1");
                A.appendChild(document.createTextNode(e1));
                element.appendChild(A);

                Element B = document.createElement("Tag2");
                B.appendChild(document.createTextNode(e2));
                element.appendChild(B);

                Element C = document.createElement("Relation");
                //C.appendChild(document.createTextNode(ms));
                element.appendChild(C);
                for(String ms: validation) {
                    Element D = document.createElement("Pattern");
                    D.appendChild(document.createTextNode(ms));
                    C.appendChild(D);
                }


                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(document);

                StreamResult streamResult = new StreamResult("validation/"+e1+"-"+e2+".xml");
                transformer.transform(source,streamResult);

            } catch (ParserConfigurationException | TransformerException e) {
                e.printStackTrace();
            }

        }//End of file[] Loop
    }

    /*=============================
     File Reader for Tagged Documents
    ==============================*/
    public static StringBuilder readFile(File xmlFile, Reader fileReader){
        try {

            fileReader = new FileReader(xmlFile);
        } catch (
                FileNotFoundException e) {
            e.printStackTrace();
        }
        BufferedReader bufReader = new BufferedReader(fileReader);
        StringBuilder sb = new StringBuilder();
        String line = null;
        try {
            line = bufReader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        while (line != null) {
            sb.append(line).append("\n");
            try {
                line = bufReader.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return(sb);
    }

    /*=============================
    Retrieve Entities on txt files
    ==============================*/
    public static String getTag(String tag){
        tag = tag.substring(tag.indexOf(":")+1);
        return(tag);
    }

    /*=============================
    Store Pair on Map
    ==============================*/
    public static void addMap(HashMap seedMap,ArrayList<String> seedEntity, int i){
        String[] classes = seedEntity.get(i).split(";", 2);
        if(classes.length >=2){
            String class1 = classes[0];
            String class2 = classes[1];
            seedMap.put(class1,class2);
        }else{
            System.out.println("ignoring line: " + i);
        }
    }

    /*=============================
    Add founded relation to TreeSet
    ==============================*/
    public static void addRelation(
            TreeSet<String> relation, String pLine,
            String class1, String class2,
            String e1, String e2){
        if(pLine.contains(class1) && pLine.contains(class2)){
            Pattern p = Pattern.compile("<\\/["+e1+"]+>.+<["+e2+"]+>");
            Matcher m = p.matcher(pLine);
            while(m.find()) {
                String temp = m.group();
                temp = temp.replaceAll("<\\/?[a-z]+>", "");
                relation.add(temp);
                //System.out.println(relation.size());
                //System.out.println(pLine);
            } // end of matcher while
        }// end of if pLine
    }

    /*=============================
    POS Tagger
    ==============================*/
    public static void POSTagger(TreeSet<String> seedPattern, String rLine, String V, String P, String W){
        MaxentTagger tagger =  new MaxentTagger("models/english-left3words-distsim.tagger");
        String tagged = tagger.tagString(rLine);
        System.out.println(tagged);
        String[] tLines= tagged.split(" ");
        for(int i=0; i<tLines.length;i++){
            //System.out.println(tLines[i]);
            if(tLines[i].matches(V)){
                String temp = tLines[i].substring(0,tLines[i].indexOf("_"));
                seedPattern.add(temp);
                if(tLines[i+1].matches(W)){
                    temp = tLines[i+1].substring(0,tLines[i+1].indexOf("_"));
                    seedPattern.add(temp);
                    if(tLines[i+2].matches(P)){
                        temp = tLines[i+2].substring(0,tLines[i+2].indexOf("_"));
                        seedPattern.add(temp);
                    }
                }
                else if(tLines[i+1].matches(P)){
                    temp = tLines[i+1].substring(0,tLines[i+1].indexOf("_"));
                    seedPattern.add(temp);
                }
                //seedPattern.add(temp);
            }
        }
    }
}
