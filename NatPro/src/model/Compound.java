package model;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class Compound {
	public static String CLASS_Compound = "Compound";
	
	public static String DP_Compound = "datatypeProperty_Compound";
	public static String DP_Synonym = "datatypeProperty_CompoundSynonym";
	
	public static String DP_PubCID = "datatypeProperty_PubCID";
	public static String DP_MolForm = "datatypeProperty_MolForm";
	public static String DP_MolWeight = "datatypeProperty_MolWeight";
	public static String DP_CanSMILES = "datatypeProperty_CanSMILES";
	public static String DP_InChI = "datatypeProperty_InChI";
	public static String DP_InChIkey = "datatypeProperty_InChIkey";
	public static String DP_IUPACName = "datatypeProperty_IUPACName";
	
	public static String DP_XLogP = "datatypeProperty_XLogP";
	public static String DP_Mass = "datatypeProperty_Mass";
	public static String DP_TPSA = "datatypeProperty_TPSA";
	public static String DP_Complexity = "datatypeProperty_Complexity";

	public static String DP_Charge = "datatypeProperty_Charge";
	public static String DP_HBondDonor = "datatypeProperty_HBondDonorCount";
	public static String DP_HBondAcceptor = "datatypeProperty_HBondAcceptorCount";
	public static String DP_RotatableBond = "datatypeProperty_RotatableBondCount";
	
	private String compoundName;
	private List<String> compoundSynonyms;
	
	private HashSet<BiologicalActivity> bioActs;
	
	private List<String> compounds;
	
	private int pubCID;
	private String molForm;
	private String canSMILES;
	private String inchi;
	private String inchikey;
	private String iupac;
	
	private double molWeight;
	private double xlogp;
	private double mass;
	private double tpsa;
	private double complexity;
	
	private int charge;
	private int hBondDonor;
	private int hBondAcceptor;
	private int rotBondCount;
	
	private boolean isMixture;
	
	public Compound() {
		compoundSynonyms = new ArrayList<String>();
	}
	
	public Compound(String compoundName) {
		this.compoundName = compoundName;
		if(compoundName.toLowerCase().contains("(i?)mixture")) {
			isMixture = true;
			compounds = new ArrayList<String>();
		}
		
	}

	public List<String> getCompounds() {
		return compounds;
	}

	public void setCompounds(List<String> compounds) {
		this.compounds = compounds;
	}

	public boolean isMixture() {
		return isMixture;
	}

	public void setMixture(boolean isMixture) {
		this.isMixture = isMixture;
	}

	public String getCompoundName() {
		return compoundName;
	}
	
	public String getCompoundNameNorm() {
		String str = compoundName.replaceAll("(?i)alpha", "&alpha;").replaceAll("(?i)beta", "&beta;").replaceAll("(?i)gamma", "&gamma;");
		if(str.toLowerCase().contains("mixture")) {
			str = str.replaceAll("\\.", ", ");
		} else {
			str = str.replaceAll("\\.", ",");
		}
		return str;
	}

	public void setCompoundName(String compoundName) {
		this.compoundName = compoundName;
	}

	public HashSet<BiologicalActivity> getBioActs() {
		return bioActs;
	}

	public void setBioActs(HashSet<BiologicalActivity> bioActs) {
		this.bioActs = bioActs;
	}

	public int getPubCID() {
		return pubCID;
	}

	public void setPubCID(int pubCID) {
		this.pubCID = pubCID;
	}
	
	public void setPubCID(String pubCID) {
		this.pubCID = Integer.parseInt(pubCID);
	}

	public String getMolForm() {
		return molForm;
	}

	public void setMolForm(String molForm) {
		this.molForm = molForm;
	}

	public double getMolWeight() {
		return molWeight;
	}

	public void setMolWeight(double molWeight) {
		this.molWeight = molWeight;
	}
	
	public void setMolWeight(String molWeight) {
		this.molWeight = Double.parseDouble(molWeight);
	}


	public String getCanSMILES() {
		return canSMILES;
	}

	public void setCanSMILES(String canSMILES) {
		this.canSMILES = canSMILES;
	}

	public String getInchi() {
		return inchi;
	}

	public void setInchi(String inchi) {
		this.inchi = inchi;
	}

	public String getInchikey() {
		return inchikey;
	}

	public void setInchikey(String inchikey) {
		this.inchikey = inchikey;
	}

	public String getIupac() {
		return iupac;
	}

	public void setIupac(String iupac) {
		this.iupac = iupac;
	}

	public double getXlogp() {
		return xlogp;
	}

	public void setXlogp(double xlogp) {
		this.xlogp = xlogp;
	}
	
	public void setXlogp(String xlogp) {
		this.xlogp = Double.parseDouble(xlogp);
	}

	public double getMass() {
		return mass;
	}

	public void setMass(double mass) {
		this.mass = mass;
	}
	
	public void setMass(String mass) {
		this.mass = Double.parseDouble(mass);
	}

	public double getTpsa() {
		return tpsa;
	}

	public void setTpsa(double tpsa) {
		this.tpsa = tpsa;
	}
	
	public void setTpsa(String tpsa) {
		this.tpsa = Double.parseDouble(tpsa);
	}

	public double getComplexity() {
		return complexity;
	}

	public void setComplexity(double complexity) {
		this.complexity = complexity;
	}
	
	public void setComplexity(String complexity) {
		this.complexity = Double.parseDouble(complexity);
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}
	
	public void setCharge(String charge) {
		this.charge = Integer.parseInt(charge);
	}

	public int gethBondDonor() {
		return hBondDonor;
	}

	public void sethBondDonor(int hBondDonor) {
		this.hBondDonor = hBondDonor;
	}
	
	public void sethBondDonor(String hBondDonor) {
		this.hBondDonor = Integer.parseInt(hBondDonor);
	}

	public int gethBondAcceptor() {
		return hBondAcceptor;
	}

	public void sethBondAcceptor(int hBondAcceptor) {
		this.hBondAcceptor = hBondAcceptor;
	}
	
	public void sethBondAcceptor(String hBondAcceptor) {
		this.hBondAcceptor = Integer.parseInt(hBondAcceptor);
	}

	public int getRotBondCount() {
		return rotBondCount;
	}

	public void setRotBondCount(int rotBondCount) {
		this.rotBondCount = rotBondCount;
	}
	
	public void setRotBondCount(String rotBondCount) {
		this.rotBondCount = Integer.parseInt(rotBondCount);
	}

	public List<String> getCompoundSynonyms() {
		return compoundSynonyms;
	}

	public void setCompoundSynonyms(List<String> compoundSynonyms) {
		this.compoundSynonyms = compoundSynonyms;
	}
}
