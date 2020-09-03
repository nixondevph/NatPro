package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.flickr4java.flickr.FlickrException;

import edu.stanford.smi.protege.exception.OntologyLoadException;
import model.Validation;
import service.OntoQuery;

/**
 * Servlet implementation class ValidationServlet
 */
@WebServlet("/ValidationServlet")
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String taggedFolder = "C:\\Users\\eduar\\Documents\\GitHub\\NatPro\\NatPro\\Documents\\TaggedBootstrap\\";
	private static final String validationFolder = "C:\\Users\\eduar\\Documents\\GitHub\\NatPro\\NatPro\\Documents\\validation\\";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		switch (request.getServletPath()) {
		case "/ValidationServlet":
			try {
				getValidationXML(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			System.out.println("URL pattern doesn't match existing patterns.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void getValidationXML(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		File Folder = new File(validationFolder);
		File[] listFiles = Folder.listFiles();
		Reader fileReader = null;
		String pdfFileName = null;
		HashSet<Validation> validations = new HashSet<Validation>();
		for (File xmlFile : listFiles) {
			ArrayList<String> lines = new ArrayList<String>();
			System.out.println(xmlFile.getAbsolutePath());
			pdfFileName = getPdfFileName(xmlFile) + ".pdf";
//			System.out.println(pdfFileName);
			request.setAttribute("pdfFileName", pdfFileName);

			Validation xmlValidation = new Validation(pdfFileName);
			xmlValidation = findIfPresent(xmlValidation, validations);

			String xmlString = readFile(xmlFile, fileReader).toString();
			String[] xmlLine = xmlString.split("\\r?\\n");
			Collections.addAll(lines, xmlLine);
			System.out.println(lines);

			TreeSet<String> CategoryList = new TreeSet<String>();
			readXML(xmlValidation, xmlFile, "Tag1");
			readXML(xmlValidation, xmlFile, "Tag2");
//			System.out.println(CategoryList);

//			for (String pLine : lines) {
//				pLine = pLine.toLowerCase();
//				 System.out.println(pLine+"/n");
//
//			}
//			xmlValidation.addSynonyms("hello there");
			validations.add(xmlValidation);
		}

		Validation xmlValidation2 = new Validation(pdfFileName+"2");
	
		xmlValidation2 = findIfPresent(xmlValidation2,validations);
		xmlValidation2.addCompounds("hellohello");
		xmlValidation2.addCompounds("hihi");
		xmlValidation2.addCompounds("hello2hello2");
		xmlValidation2.addCompounds("hellohello");
		validations.add(xmlValidation2);

//		for (Validation temp : validations) {
//			System.out.println(temp.getPdfFileName());
//			for (String mp : temp.getCompounds()) {
//				System.out.println(mp);
//			}
//		}
//		System.out.println("HERE:"+validations.iterator().next().getSynonyms().iterator().next().toString());
		request.setAttribute("Validations", validations);
		request.getRequestDispatcher("_validation-new.jsp").forward(request, response);

	}

	Validation findIfPresent(Validation curValidation, HashSet<Validation> validations) {
		if (validations.contains(curValidation)) {
			for (Validation v : validations) {
				if (v.equals(curValidation))
					return v;
			}
		}

		return curValidation;
	}

	public StringBuilder readFile(File xmlFile, Reader fileReader) {
		try {

			fileReader = new FileReader(xmlFile);
		} catch (FileNotFoundException e) {
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
		return (sb);
	}

	public String getPdfFileName(File xmlFile) {
		String pdfFileName = null;
		Pattern pattern = Pattern.compile("^([A-Z]*)\\w+");
		Matcher matcher = pattern.matcher(xmlFile.getName());
		if (matcher.find()) {
			pdfFileName = matcher.group();
		}
		return pdfFileName;

	}

	public void readXML(Validation validation, File xmlFile, String tag) {
		// CHECKS IF THE GENERATED XML FILE EXISTS
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			/*
			 * =============================================================================
			 * ==========================
			 * =============================================================================
			 * ========================== NOTE: CHECK IF FOLDER EXISTS
			 * =============================================================================
			 * ==========================
			 * =============================================================================
			 * ==========================
			 */
			Document doc = builder.parse(xmlFile.getAbsoluteFile());

			doc.getDocumentElement().normalize();
			// System.out.println("Root element: " +
			// doc.getDocumentElement().getNodeName());
			NodeList nodeList = doc.getElementsByTagName("Seed");
			for (int i = 0; i < nodeList.getLength(); i++) {
				Node nNode = nodeList.item(i);
				// System.out.println("Node Name: " + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					// System.out.println("I am here");
					Element eElement = (Element) nNode;
					int eCount = eElement.getElementsByTagName(tag).getLength();
					for (int j = 0; j < eCount; j++) {
						// System.out.println(eElement.getElementsByTagName("Pattern").item(j).getTextContent());
//						System.out.println(eElement.getElementsByTagName("Tag1").item(0).getTextContent());
						String tag1 = eElement.getElementsByTagName(tag).item(j).getTextContent();
						Element nameElement = (Element) eElement.getElementsByTagName(tag).item(j);
						if (tag1.contains("plantpart")) {
							System.out.println("plantpart");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addPlantParts(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("bioact")) {
							System.out.println("bioact");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addBioActs(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("compound")) {
							System.out.println("compound");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addCompounds(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("synonym")) {
							System.out.println("synonym");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addSynonyms(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("medicinalplant")) {
							System.out.println("medicinalplant");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addMedicinalPlants(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("genus")) {
							System.out.println("genus");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addGenus(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("family")) {
							System.out.println("family");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addFamily(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("preparation")) {
							System.out.println("preparation");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addPreparation(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						} else if (tag1.contains("illness")) {
							System.out.println("illness");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addIllness(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						}
						else if (tag1.contains("location")) {
							System.out.println("location");
							for (int k = 0; k < nameElement.getElementsByTagName("Name").getLength(); k++) {
								System.out.println(nameElement.getElementsByTagName("Name").item(k).getTextContent());
								validation.addLocation(nameElement.getElementsByTagName("Name").item(k).getTextContent());
							}
						}

//						matches.add(eElement.getElementsByTagName("Tag1").item(j).getTextContent());
					}

				}
			}
		} catch (ParserConfigurationException | IOException e) {
			e.printStackTrace();
		} catch (org.xml.sax.SAXException e) {
			e.printStackTrace();
		}
	}

}