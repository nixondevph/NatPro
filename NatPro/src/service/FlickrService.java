package service;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.SearchParameters;

public class FlickrService {
	public static void main(String[] args) throws FlickrException {
		new FlickrService();
	}
	
	public FlickrService() throws FlickrException {
		String apikey = "091207bccef6c4eb9697af2c1d7494f1";
		String secret = "8fc03d3f7b19f731";
		
		Flickr flickr = new Flickr(apikey, secret, new REST());

	    // Set the wanted search parameters (I'm not using real variables in the example)
	    SearchParameters searchParameters = new SearchParameters();
	    searchParameters.setText("batino plant");
	    searchParameters.setSafeSearch("1");
	    searchParameters.setLicense("0");
	    //searchParameters.setSort(SearchParameters.INTERESTINGNESS_DESC);
	    searchParameters.setSort(SearchParameters.RELEVANCE);
	    
	    PhotoList<Photo> list = flickr.getPhotosInterface().search(searchParameters, 0, 0);
	    
	    for(Photo photo: list) {
	    	System.out.println(photo.getMediumUrl());
	    }
		
	    System.err.println(list.size());
	}
}